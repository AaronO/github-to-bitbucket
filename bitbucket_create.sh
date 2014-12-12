#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

# Should be formatted as :
# owner/repo

# Repo to create
bitbucket_repo=$1

curl -n -X POST "https://api.bitbucket.org/2.0/repositories/${bitbucket_repo}" \
    -H "Content-Type: application/json" \
    -d '{"scm": "git", "is_private": "true", "fork_policy": "no_public_forks" }'
