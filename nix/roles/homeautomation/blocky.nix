{ pkgs, pkgs-unstable, ... }:

{
  services.blocky = {
    enable = true;
    settings = {
      # listen
      ports.dns = 53;
      ports.http = 4000;

      # logging
      log.level = "info";
      log.timestamp = true;
      log.privacy = true; # hide client IPs and domains in logs

      # used to resolve the IP addresses of the upstream DNS servers and the denylist URLs
      bootstrapDns = {
        upstream = "https://one.one.one.one/dns-query";
        ips = [ "1.1.1.1" "1.0.0.1" ];
      };

      # upstreams
      upstreams.init.strategy = "fast";
      upstreams.groups.default = [
        "https://one.one.one.one/dns-query" # Cloudflare's DNS over HTTPS
      ];

      # conditional forwarding
      conditional = {
        mapping = {
          lan = "10.98.0.1"; # local network
        };
      };

      # block lists
      blocking = {
        blockType = "zeroIP";
        blackLists = {
          ads = [
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
            "https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts"
            "https://adaway.org/hosts.txt"
            "https://v.firebog.net/hosts/AdguardDNS.txt"
            "https://v.firebog.net/hosts/Easylist.txt"
            "https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
          ];
          malicious = [
            "https://v.firebog.net/hosts/Easyprivacy.txt"
            "https://paulgb.github.io/BarbBlock/blacklists/hosts-file.txt"
            "https://raw.githubusercontent.com/RooneyMcNibNug/pihole-stuff/master/SNAFU.txt"
            "https://v.firebog.net/hosts/neohostsbasic.txt"
            "https://winhelp2002.mvps.org/hosts.txt"
            "https://raw.githubusercontent.com/VeleSila/yhosts/master/hosts"
            "https://someonewhocares.org/hosts/zero/hosts"
            "https://raw.githubusercontent.com/matomo-org/referrer-spam-blacklist/master/spammers.txt"
            "https://raw.githubusercontent.com/PolishFiltersTeam/KADhosts/master/KADhosts.txt"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Spam/hosts"
            "https://v.firebog.net/hosts/static/w3kbl.txt"
            "https://urlhaus.abuse.ch/downloads/hostfile/"
            "https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt"
            "https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-malware.txt"
            "https://phishing.army/download/phishing_army_blocklist_extended.txt"
            "https://bitbucket.org/ethanr/dns-blacklists/raw/8575c9f96e5b4a1308f2f12394abd86d0927a4a0/bad_lists/Mandiant_APT1_Report_Appendix_D.txt"
            "https://v.firebog.net/hosts/Prigent-Crypto.txt"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt"
            "https://osint.digitalside.it/Threat-Intel/lists/latestdomains.txt"
            "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt"
          ];
          tracking = [
            "https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt"
            "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/AmazonFireTV.txt"
            "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt"
            "https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/android-tracking.txt"
            "https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt"
            "https://hostfiles.frogeye.fr/multiparty-trackers-hosts.txt"
            "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
            "https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt"
            "https://v.firebog.net/hosts/Prigent-Ads.txt"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts"
          ];
        };

        # client groups
        clientGroupsBlock = {
          default = [ "ads" "malicious" "tracking" ];
          "1.2.3.4/32" = [ ]; # supports host-specific overrides
        };
      };

      # caching
      caching = {
        minTime = "5m";
        maxTime = "30m";
        prefetching = true;
      };
    };
  };
}
