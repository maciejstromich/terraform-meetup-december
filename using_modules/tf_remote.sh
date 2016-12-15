#!/usr/bin/env bash


REMOTE_STATE_BUCKET="tfmeetup-remote-state"
REMOTE_STATE_FILE="mystate.tfstate"
REGION="us-west-2"

rm -rf .terraform

terraform remote config \
  -backend=s3 \
  -backend-config="bucket=${REMOTE_STATE_BUCKET}" \
  -backend-config="key=${REMOTE_STATE_FILE}" \
  -backend-config="region=${REGION}"

terraform get
terraform apply

aws s3 cp s3://${REMOTE_STATE_BUCKET}/${REMOTE_STATE_FILE} s3://${REMOTE_STATE_BUCKET}/old_${REMOTE_STATE_FILE}
