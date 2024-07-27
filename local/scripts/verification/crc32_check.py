#! /usr/bin/env nix-shell
#! nix-shell -i python3 -p python3 nix.out

import os
import re
import zlib
import sys


def compute_crc32(filename):
    """Compute the CRC32 hash of the given file."""
    buf_size = 65536
    crc32 = 0
    with open(filename, 'rb') as f:
        while chunk := f.read(buf_size):
            crc32 = zlib.crc32(chunk, crc32)
    return format(crc32 & 0xFFFFFFFF, '08X')


def find_files_with_crc32(directory):
    """Find files in the directory and check CRC32 hash in the filename."""
    pattern = re.compile(r'\[([0-9A-Fa-f]{8})\]')
    for root, _, files in os.walk(directory):
        print(f'Checking {len(files)} files in "{root}"...')
        for filename in files:
            match = pattern.search(filename)
            if match:
                hash_in_name = match.group(1).upper()
                filepath = os.path.join(root, filename)
                actual_crc32 = compute_crc32(filepath)
                if hash_in_name == actual_crc32:
                    print(f'File "{filename}" is valid (CRC32: {hash_in_name})')
                else:
                    print(f'File "{filename}" is invalid (Expected: {hash_in_name}, Actual: {actual_crc32})')


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: crc32_check.py <directory>")
        sys.exit(1)
    directory = sys.argv[1]
    if not os.path.isdir(directory):
        print(f'Error: "{directory}" is not a valid directory')
        sys.exit(1)
    find_files_with_crc32(directory)
