#!/bin/bash


PROJECT_NAME='tina-material-tree'
date=`date +%Y-%m-%d`
payloadData='{special: $TRAVIS_COMMIT}'
TOKEN=$FIREBASE_TOKEN

echo $date
if [[ $TRAVIS_PULL_REQUEST == "false" ]]; then
  firebase database:update --data "$payloadData" --project $PROJECT_NAME --confirm --token "$TOKEN" /payload/$date/$TRAVIS_COMMIT
fi

echo $payloadData

exit 1
