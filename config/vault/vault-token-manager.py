#!/usr/bin/env python3

import os
import sys
import json

vault_addr = os.getenv('VAULT_ADDR')
if not vault_addr:
  sys.stderr.write("No VAULT_ADDR environment variable set. Set it and run me again!\n")
  sys.exit(100)

vault_tokens_path = os.path.join(os.getenv('HOME'), '.local/state/vault/.vault_tokens')
os.makedirs(os.path.dirname(vault_tokens_path), exist_ok=True) # create dir

# read tokens
try:
  with open(vault_tokens_path, 'r') as f:
    tokens = json.load(f)
except FileNotFoundError:
    tokens = {}

# handle commands
if len(sys.argv) > 1:
  command = sys.argv[1]

  if command == 'get':
    if vault_addr in tokens:
      print(tokens[vault_addr], end='')
    sys.exit(0)
  elif command == 'store':
    token = sys.stdin.read().strip()
    tokens[vault_addr] = token
  elif command == 'erase':
    tokens.pop(vault_addr, None)

# write tokens
with open(vault_tokens_path, 'w') as f:
  json.dump(tokens, f)
