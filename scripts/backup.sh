#!/usr/bin/env bash
set -euo pipefail

REPO_NAME=$(basename "$(pwd)")
DATE=$(date +%Y%m%d-%H%M)
HASH=$(git rev-parse --short HEAD 2>/dev/null || echo "nohash")
TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "no-tag")
OUTDIR="backups"
mkdir -p "$OUTDIR"
BASENAME="${REPO_NAME}-${DATE}-${TAG}-${HASH}"

MODE="${1:-zip}"  # default to zip; use 'tar' for .tar.gz
case "$MODE" in
  zip)
    ARCHIVE="$OUTDIR/$BASENAME.zip"
    # Create ZIP, exclude .git and backups themselves
    zip -r "$ARCHIVE" . -x ".git/*" "backups/*"
    ;;
  tar|tgz)
    ARCHIVE="$OUTDIR/$BASENAME.tar.gz"
    tar --exclude=".git" --exclude="backups" -czvf "$ARCHIVE" .
    ;;
  *)
    echo "Usage: $0 [zip|tar]"
    exit 1
    ;;
esac

echo "✅ Created archive: $ARCHIVE"
