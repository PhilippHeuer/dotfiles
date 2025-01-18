"""
Video Encoding Script

Description:
    This script encodes a video file using FFmpeg with the libx265 HEVC encoder.

Usage:
    python vencode.py <input_file> <video_codec>

Parameters:
    input_file : str
        Path to the original reference video file.
    video_codec : str
        Video codec to use for encoding (libx265, hevc_amf, av1).
"""

import argparse
import logging
import os
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
parser.add_argument("input_file", help="Input file")
parser.add_argument("video_codec", help="Video codec", choices=["libx265", "hevc_amf", "av1"], default="libx265")
args = parser.parse_args()

inputFile = args.input_file
videoCodec = args.video_codec

# parameters
filename, extension = os.path.splitext(inputFile)
outputFile = f"{filename}[HEVC]{extension}"
ffmpeg_args = [
    "-v", "error",
    "-i", inputFile, 
    "-n",  # don't overwrite existing files
    "-map", "0",  # map all streams (audio, video, subtitles, etc.)
    "-map_metadata", "0",  # map metadata from input file
    "-map_chapters", "0",  # map chapters from input file
    "-c:a", "copy",  # copy all audio streams without re-encoding
    "-c:s", "copy",  # copy all subtitle streams without re-encoding
    "-c:t", "copy",  # copy all attachment streams without re-encoding
]

if videoCodec == "libx265":
    encoderParams = [
        # Performance optimizations
        "pmode", # Enable parallel mode decision for improved performance
        "pme", # Enable parallel motion estimation for faster processing

        # Preset and profile settings
        #"preset=placebo", # Slowest encoding preset with the highest quality
        "profile=main10", # Use Main10 profile for 10-bit color depth
        "high-tier", # Enable High Tier for higher allowable bitrates

        # Partitioning and prediction
        "no-rect",  # Disable rectangular motion partitions for simpler motion estimation
        "no-amp",  # Disable asymmetric motion partitions for faster encoding
        "weightb",  # Enable weighted prediction for B-frames

        # Rate control and reference frames
        "rc-lookahead=90",  # Look ahead 90 frames for better bitrate distribution
        "limit-refs=0",  # No limit on the number of reference frames
        "limit-tu=0",  # No limit on transform unit sizes
        "dynamic-refine",  # Enable dynamic refinement of prediction modes
        "b-intra",  # Enable intra-prediction for B-frames

        # Transform and quantization depth
        "tu-inter-depth=4",  # Maximum depth for inter transform units
        "tu-intra-depth=4",  # Maximum depth for intra transform units

        # Refinement
        "refine-intra=4",  # Intra prediction refinement level
        "refine-mv=3",  # Motion vector refinement level
        "rskip=0",  # Disable residual skipping optimization
        
        # Motion estimation
        "subme=5",  # Subpixel motion estimation quality level
        "me=3",  # Motion estimation method
        "max-merge=5",  # Maximum number of merge candidates
        "ref=6",  # Number of reference frames
        "bframes=8",  # Maximum number of consecutive B-frames
        "rd=6",  # Rate-distortion optimization level
        
        # Coding tree units (CTU)
        "ctu=64",  # Maximum CTU size (64x64, the largest allowed in HEVC)
        "merange=57",  # Motion estimation range (57 pixels)
        
        # Quantization and in-loop filtering
        "rdoq-level=2",  # Rate-distortion optimized quantization (RDOQ) level
        "no-tskip",  # Disable transform skipping
        "no-tskip-fast",  # Disable fast transform skipping
        "no-fast-intra",  # Disable fast intra mode decisions
        "no-constrained-intra",  # Disable constrained intra prediction
        "no-cu-lossless",  # Disable CU-level lossless coding
        "no-lossless",  # Ensure no lossless coding is used
        "slow-firstpass",  # Use a slower, higher-quality first pass
        "no-open-gop",  # Disable open GOPs (Group of Pictures)
        "no-strong-intra-smoothing",  # Disable strong intra smoothing for DC intra prediction
        "no-sao",  # Disable Sample Adaptive Offset (reduces blurring artifacts)

        # Filtering and detail preservation
        "deblock=-1:-1",  # Adjust deblocking filter to slightly preserve detail more than smoothing
        "no-cutree",  # Disable CU-tree optimization for consistent rate control

        # Rate control and psychovisual tuning
        "qcomp=0.6",  # Quantizer curve compression, balancing quality across frames
        "psy-rd=1.5",  # Psychovisual rate-distortion optimization for spatial detail
        "psy-rdoq=2",  # Psychovisual optimization for quantization
        "aq-strength=0.7",  # Strength of adaptive quantization (AQ)
        "aq-mode=3",  # AQ mode 3, prioritizing complex regions for better quality

        # Chroma quantization adjustments
        "cbqpoffs=-1",  # Quantizer offset for Cb (chroma blue) channel
        "crqpoffs=-1",  # Quantizer offset for Cr (chroma red) channel
    ]
    ffmpeg_args = ffmpeg_args + [
        "-c:v", "libx265",  # libx265 is the software HEVC encoder
        "-vtag", "hvc1",  # add the 'hvc1' tag for Apple device compatibility
        "-preset", "veryfast", # Set the encoding speed/quality trade-off (veryfast is faster)
        "-crf", "18",  # Set Constant Rate Factor (CRF) for video quality (lower = better)
        "-tune", "animation",  # tune for animation
        "-x265-params", ":".join(encoderParams),
        "-pix_fmt", "yuv420p10le", # use pixel format yuv420p10le
    ]
elif videoCodec == "hevc_amf":
    ffmpeg_args = ffmpeg_args + [
        "-c:v", "hevc_amf",  # hevc_amf is the AMD hardware-accelerated HEVC encoder
        "-profile:v", "main10", # 10-bit color depth
        "-quality", "0", # set quality mode (0 = quality - 10 = speed)
        "-tier", "high", # enable high tier to support higher bitrates in HEVC
        "-vtag", "hvc1",  # add the 'hvc1' tag for Apple device compatibility
        "-rc", "cqp", # use constant quantization parameter (CQP) rate control
        "-qp", "17",
        "-tune", "animation",  # tune for animation
        "-pix_fmt", "yuv420p10le", # use pixel format yuv420p10le
    ]
elif videoCodec == "av1":
    ffmpeg_args = ffmpeg_args + [
        "-c:v", "libsvtav1",  # libsvtav1 is the AV1 encoder
        "-crf", "18",  # Set Constant Rate Factor (CRF) for video quality (lower = better)
        "-tune", "animation",  # tune for animation
        "-x265-params", "limit-sao=1:deblock=1,1:bframes=8:ref=6:psy-rd=1.5:psy-rdoq=2:aq-mode=3", # x265 parameters
        "-pix_fmt", "yuv420p10le", # use pixel format yuv420p10le
    ]

# execute
try:
    cmd = ["ffmpeg"] + ffmpeg_args + [outputFile]
    logging.info(f"Encoding command: {' '.join(cmd)}")

    subprocess.run(cmd, check=True)
    logging.info(f"Encoding complete. Output file: {outputFile}")
except subprocess.CalledProcessError as e:
    logging.error(f"Error during encoding: {e}")
    sys.exit(1)
