#!/bin/sh
check_sucessful(){
  if [ $? != 0 ];
  then
    echo "Error execution"
    exit 1
  fi
}

init(){
  terraform init \
    -backend=true \
    -backend-config="bucket=rocketseat-terraform-remote-state-us-east-1-dev-v1" \
    -backend-config="key=${REMOTE_STATE_FILE}" \
    -backend-config="region=${REMOTE_STATE_AWS_REGION}" 
}


validate(){
  terraform validate
}

init
  check_sucessful

validate
  check_sucessful
