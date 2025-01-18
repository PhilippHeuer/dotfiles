"""
Video Quality Assessment Script

Description:
    This script evaluates the quality of an encoded video by comparing it
    to the original video using the Video Multi-Method Assessment Fusion (VMAF) metric.
    VMAF is a widely used video quality metric developed by Netflix, designed to
    provide a perceptually accurate comparison of video quality.

Usage:
    python vmaf.py <encoded_file> <original_file>

Parameters:
    encoded_file : str
        Path to the encoded video file that needs quality evaluation.
    original_file : str
        Path to the original reference video file.

Output:
    - The script runs the FFmpeg command with the libvmaf filter.
    - It logs the progress and outcome of the quality assessment.
    - If successful, the VMAF score will be visible in the FFmpeg output.

Exit Codes:
    0: Success.
    1: Missing arguments or invalid files.
    2: FFmpeg or VMAF-related errors.

Notes:
    - The `n_subsample` parameter in the libvmaf filter controls the sampling rate.
      Lower values increase accuracy at the cost of processing speed.
    - The script assumes FFmpeg outputs VMAF scores in its console logs.
"""

import argparse
import logging
import os
import shutil
import subprocess
import sys

# logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)]
)

# arguments
parser = argparse.ArgumentParser(description="Evaluate encoded video quality using VMAF.")
parser.add_argument("encoded_file", help="Path to the encoded video file.")
parser.add_argument("original_file", help="Path to the original video file.")
args = parser.parse_args()

encodedFile = args.encoded_file
originalFile = args.original_file

# checks
if not os.path.isfile(encodedFile):
    logging.error(f"Encoded file not found: {encodedFile}")
    sys.exit(1)

if not os.path.isfile(originalFile):
    logging.error(f"Original file not found: {originalFile}")
    sys.exit(1)

if not shutil.which("ffmpeg"):
    logging.error("FFmpeg not found in PATH. Please install FFmpeg to continue.")
    sys.exit(1)

# arguments
ffmpeg_args = [
    #"-v", "error",
    "-i", encodedFile,
    "-i", originalFile,
    "-lavfi", "libvmaf=n_subsample=100", # lower n_subsample for more accurate but slower results
    "-f", "null",
    "-"
]

# execute
try:
    cmd = ["ffmpeg"] + ffmpeg_args
    logging.info(f"Encoding command: {' '.join(cmd)}")

    subprocess.run(cmd, check=True)
    logging.info(f"VMAF complete.")
except subprocess.CalledProcessError as e:
    logging.error(f"Error during assessment: {e}")
    sys.exit(1)
