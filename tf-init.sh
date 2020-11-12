#!/bin/bash

[ $# -ne 4 ] && echo "You must supply exactly 4 arguments: ./tf-init.sh <gitlab domain> <username> <personal access token> <project id>" && exit 1

GITLAB_DOMAIN=$1
GITLAB_USERNAME=$2
GITLAB_PERSONAL_ACCESS_TOKEN=$3
GITLAB_PROJECT_ID=$4
STATE_NAME=default

terraform init \
  -backend-config="address=https://${GITLAB_DOMAIN}/api/v4/projects/${GITLAB_PROJECT_ID}/terraform/state/$STATE_NAME" \
  -backend-config="lock_address=https://${GITLAB_DOMAIN}/api/v4/projects/${GITLAB_PROJECT_ID}/terraform/state/$STATE_NAME/lock" \
  -backend-config="unlock_address=https://${GITLAB_DOMAIN}/api/v4/projects/${GITLAB_PROJECT_ID}/terraform/state/$STATE_NAME/lock" \
  -backend-config="username=${GITLAB_USERNAME}" \
  -backend-config="password=${GITLAB_PERSONAL_ACCESS_TOKEN}" \
  -backend-config="lock_method=POST" \
  -backend-config="unlock_method=DELETE" \
  -backend-config="retry_wait_min=5"
