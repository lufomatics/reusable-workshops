#!/usr/bin/env bash

set -e


git config --global alias.sparse-clone '!bash -c '\''
  REPO=${1:-}; DIR=${2:-};
  [ -z "$REPO" ] && read -p "Repo URL: REPO;
  [ -z "$DIR"] && read -p "Dir to sparse-checkout: " DIR;
  git clone --filter=blob:none --sparse "$REPO"  && \
    cd "$(basename "$REPO" .git)" && \
    git sparse-checkout set "$DIR"
'\'' --'

git config --global alias.sparse-init '!bash -c '\''
  DIR=${1:-};
  [ -z "$DIR"] && read -p "Directory to sparse-checkout: " DIR;
  #auto-enable sparse mode and pull only $DIR
  git sparse-checkout set "$DIR"
'\'' --'

echo "✅ Done. You can now run:"
echo "  git sparse-clone [<repo-url>] [<path>]"
echo "  git sparse-init [<path>]"