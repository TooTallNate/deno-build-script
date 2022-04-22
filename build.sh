#!/usr/bin/env bash
set -euo pipefail

DENO_VERSION="1.21.0"

# First, ensure that Deno is available
ARCH="x86_64"
PLATFORM="unknown-linux-gnu"
if [ "$(uname -s)" = "Darwin" ]; then
  PLATFORM="apple-darwin"
fi
DENO_PATH=".vercel/cache/deno/bin-$ARCH-$PLATFORM-v$DENO_VERSION"
if [ ! -x "$DENO_PATH/deno" ]; then
    mkdir -p "$DENO_PATH"
    pushd "$DENO_PATH"
    DENO_URL="https://github.com/denoland/deno/releases/download/v$DENO_VERSION/deno-$ARCH-$PLATFORM.zip"
    curl -sfLS "$DENO_URL" > deno.zip
    unzip deno.zip
    rm deno.zip
    popd
else
    echo "Deno v$DENO_VERSION already downloaded"
fi

# Add downloaded version of Deno to $PATH
export PATH="$DENO_PATH:$PATH"
which deno

# Run the build command
exec deno run --allow-write build.ts
