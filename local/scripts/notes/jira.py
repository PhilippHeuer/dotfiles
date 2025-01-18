#! /usr/bin/env nix-shell
#! nix-shell -i python3 -p python312Full python312Packages.requests python312Packages.datetime

import argparse
import datetime
import logging
import os

import requests

# logging
logging.basicConfig()
logging.getLogger().setLevel(logging.INFO)

# arguments
parser = argparse.ArgumentParser(description="Fetch worklogs from Jira.")
parser.add_argument("jira_server", help="Jira server URL")
parser.add_argument("jira_token", help="Jira API token")
args = parser.parse_args()

jiraServer = args.jira_server
jiraToken = args.jira_token

if jiraServer.startswith("file:"):
    file_path = jiraServer[5:]
    if os.path.exists(file_path):
        with open(file_path, 'r') as file:
            jiraServer = file.read().strip()
    else:
        raise FileNotFoundError(f"File not found: {file_path}")
if jiraToken.startswith("file:"):
    file_path = jiraToken[5:]
    if os.path.exists(file_path):
        with open(file_path, 'r') as file:
            jiraToken = file.read().strip()
    else:
        raise FileNotFoundError(f"File not found: {file_path}")

# configuration
headers = {
    "Accept": "application/json",
    "Authorization": f"Bearer {jiraToken}",
    "Content-Type": "application/json"
}


def fetch_worklogs(from_date, to_date):
    payload = {
        "from": from_date,
        "to": to_date
    }

    requestsSession=requests.Session()
    requestsSession.trust_env=False
    response = requestsSession.post(jiraServer + "/rest/tempo-timesheets/4/worklogs/search", headers=headers, json=payload)
    if response.status_code == 200:
        return response.json()
    else:
        logging.info(f"Failed to fetch worklogs: {response.status_code}, {response.text}")
        return []


def worklogs_by_day(worklogs):
    worklogs_by_day = {}
    for worklog in worklogs:
        worklogStartedDate = datetime.datetime.fromisoformat(worklog["started"])
        worklog_date = worklogStartedDate.date().strftime("%Y-%m-%d")
        if worklog_date not in worklogs_by_day:
            worklogs_by_day[worklog_date] = []
        worklogs_by_day[worklog_date].append(worklog)

    return worklogs_by_day


def merge_worklogs(worklogs):
    merged = {}
    for worklog in worklogs:
        issue_key = worklog["issue"].get("key", "Unknown")
        issue_title = worklog["issue"].get("summary", "Unknown")
        comment = worklog.get("comment", "")
        time_spent = worklog.get("timeSpentSeconds", 0)

        if issue_key not in merged:
            merged[issue_key] = {"title": issue_title, "comments": [], "totalTime": 0}

        if comment != "" and not comment.startswith("Working on issue "):
            comments = comment.split("\n")
            for c in comments:
                merged[issue_key]["comments"].append(c)

        merged[issue_key]["totalTime"] += time_spent

    return merged


def write_worklogs_to_file(date, worklog_items):
    home_dir = os.getenv("HOME")
    output_dir = f"{home_dir}/source/notes/journal"
    filename = f"{output_dir}/{date}.md"

    print(f"# {date} - {filename}")
    for issue_key, data in worklog_items.items():
        for comment in data["comments"]:
            print(f"- [{issue_key}] {data['title']}: {comment}")

    # tempo worklog entries
    new_lines = []
    for issue_key, data in worklog_items.items():
        for comment in data["comments"]:
            new_lines.append(f"- [{issue_key}] {data['title']}: {comment}\n")

    # user worklog entries
    if os.path.exists(filename):
        with open(filename, "r", encoding="utf-8") as file:
            lines = file.readlines()

            for line in lines:
                if line.startswith("- ["):
                    continue
                if not line.startswith("- "):
                    continue
                new_lines.append(line)

    with open(filename, "w", encoding="utf-8") as file:
        file.write(f"# Journal - {date}\n\n")
        file.writelines(new_lines)


if __name__ == "__main__":
    from_date = (datetime.date.today() - datetime.timedelta(days=3)).strftime("%Y-%m-%d")
    to_date = datetime.date.today().strftime("%Y-%m-%d")

    logging.info("Fetching worklogs from %s to %s", from_date, to_date)
    worklogs = fetch_worklogs(from_date, to_date)

    # Store worklogs in a list
    worklog_entries = []
    if worklogs:
        worklog_entries.extend(worklogs)

    # collect worklog entries per day
    organized_worklogs = worklogs_by_day(worklog_entries)
    for date, worklogs in organized_worklogs.items():
        merged_worklogs = merge_worklogs(worklogs)
        write_worklogs_to_file(date, merged_worklogs)

    logging.info("Worklogs processed and written to files.")
