#!/bin/bash

spinners=$(cat spinners.json|jq 'keys' |tr ',' ' ' |grep -v '\[' |grep -v '\]' |xargs)

for s in $spinners; do
  cat spinners.json|jq .${s}.frames | tr -d '\['  |tr -d '\]' |tr ',' ' ' |sed -e 's/^[[:space:]]*//'
done
