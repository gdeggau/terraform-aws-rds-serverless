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
    -backend-config="bucket=rocketseat-${REMOTE_STATE_BUCKET}-${REMOTE_STATE_AWS_REGION}-${ENV}-${ENV_VERSION}" \
    -backend-config="key=${REMOTE_STATE_FILE}" \
    -backend-config="region=${REMOTE_STATE_AWS_REGION}" 
}

plan(){
  terraform plan  \
    -var env="${ENV}" \
    -var envVersion="${ENV_VERSION}" \
    -var region="${AWS_REGION}" \
    -var product="${PRODUCT}" \
    -var createdBy="${CREATED_BY}" \
    -var owner="${OWNER}" \
    -var project="${PROJECT}" \
    -var role="${ROLE}" \
    -var engine="${ENGINE}" \
    -var engineVersion="${ENGINE_VERSION}" \
    -var databaseName="${DATABASE_NAME}" \
    -var databaseUsername="${DATABASE_USERNAME}" \
    -var backupRetentionPeriod="${BACKUP_RETENTION_PERIOD}" \
    -var storageEncrypted="${STORAGE_ENCRYPTED}" \
    -var deletionProtection="${DELETION_PROTECTION}" \
    -var envVersion="${ENV_VERSION}" \
    -var engineMode="${ENGINE_MODE}" \
    -var skipFinalSnapshot="${SKIP_FINAL_SNAPSHOT}" \
    -var copyTagsToSnapshot="${COPY_TAGS_TO_SNAPSHOT}" \
    -var autoPause="${AUTO_PAUSE}" \
    -var maxCapacity="${MAX_CAPACITY}" \
    -var minCapacity="${MIN_CAPACITY}" \
    -var secondsUntilAutoPause="${SECONDS_UNTIL_AUTO_PAUSE}" \
    -var timeoutAction="${TIMEOUT_ACTION}" \
    -out="plan.tfout"
}

apply(){
  terraform apply plan.tfout
    check_sucessful

  rm -rf plan.tfout
    check_sucessful
}

init
  check_sucessful

plan
  check_sucessful

apply
  check_sucessful