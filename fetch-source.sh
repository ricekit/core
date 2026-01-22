#!/bin/sh
# This script fetches the source code from a given Git repository URL
# and checks out a specific branch or tag.  

# Usage: ./fetch-source.sh <repository_url> <branch_or_tag> <destination_directory>
set -e
REPO_URL=$1
BRANCH_OR_TAG=$2
DEST_DIR=${3:-.}
if [ -z "$REPO_URL" ]; then
    echo "Usage: $0 <repository_url> [branch_or_tag] [destination_directory]"
    exit 1
fi

# Clone the repository
cd /app/repos
git clone --bare "$REPO_URL" 
cd "$DEST_DIR"

if [ -z "$BRANCH_OR_TAG" ]; then
    # Detect default branch if none specified
    BRANCH_OR_TAG=$(git rev-parse --abbrev-ref HEAD)
fi

git checkout "$BRANCH_OR_TAG" /app/riceuser/${DEST_DIR} 
