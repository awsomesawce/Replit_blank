#!/bin/bash
# This script is used to download the main configuration files for replit nix.


# Test if curl is installed
has_curl() {
  if command -v curl >/dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

# test if file exists
file_exists() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: file_exists <file_path>"
    return 2
  fi
  if [ -f "$1" ]; then
    return 0
  else
    return 1
  fi
}


download_main_conf() {

  if [[ "$#" -gt 0 ]]; then
    echo "No args needed.  Try again" >&2
    return 1
  fi
    local u="https://raw.githubusercontent.com/awsomesawce/Git-t/main/replit.nix"
    local outfile="main_replit.nix"
    if file_exists "$outfile"; then
      echo "File $outfile already exists.  skipping download." >&2
      return 1
    fi
    
    if has_curl; then
      command curl -sS "$u" -o "$outfile"
    else
      echo "curl is not installed. Please install it and try again." >&2
      return 1
    fi
}

download_main_conf "$@"
