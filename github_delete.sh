#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail


# Should be formatted as :
# owner/repo

# Repo to delete
github_repo=$1

curl -n -X DELETE "https://api.github.com/repos/${github_repo}"
