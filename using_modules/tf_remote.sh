#!/bin/bash

rm -rf .terraform

terraform remote config \
  -backend=s3 \
  -backend-config="bucket=tfmeetup-remote-state" \
  -backend-config="key=mystate.tfstate" \
  -backend-config="region=us-west-2"

terraform get
terraform apply
