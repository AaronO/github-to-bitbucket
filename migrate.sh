#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

# Constants
TMP_DIR="/tmp/github_to_bitbucket"

# Both should be formatted as :
# owner/repo

# Repo to migrate from
github_repo=$1
# Repo to migrate to
bitbucket_repo=$2
# directory for this repo
tmp_dir="${TMP_DIR}/${github_repo}"

# Make tmp tmpdir (ensure it exists)
mkdir -p "${tmp_dir}"

# Switch to that directory
cd "${tmp_dir}"

# Clone GitHub repo
git clone --bare "https://github.com/${github_repo}.git" .

# Push to bitbucket
git push --mirror "https://bitbucket.org/${bitbucket_repo}.git"
