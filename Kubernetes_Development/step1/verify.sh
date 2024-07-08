#!/bin/bash

EXPECTED_POD_NAME="mypod"
EXPECTED_NAMESPACE="env"
EXPECTED_ENV_VAR_NAME="my-env"
EXPECTED_ENV_VAR_VALUE="new-enviroment"

# Check if the Pod is running
if kubectl get pod $EXPECTED_POD_NAME -n $EXPECTED_NAMESPACE &> /dev/null; then
  # Check if the Pod has the expected environment variable
  if kubectl get pod $EXPECTED_POD_NAME -n $EXPECTED_NAMESPACE -o jsonpath='{.spec.containers[0].env[?(@.name=="'$EXPECTED_ENV_VAR_NAME'")].value}' | grep -q "$EXPECTED_ENV_VAR_VALUE"; then
    echo "Task completed successfully. Pod '$EXPECTED_POD_NAME' with the expected environment variable exists in namespace '$EXPECTED_NAMESPACE'."
  else
    echo "Task failed. Pod '$EXPECTED_POD_NAME' does not have the expected environment variable '$EXPECTED_ENV_VAR_NAME' with value '$EXPECTED_ENV_VAR_VALUE'."
  fi
else
  echo "Task failed. Pod '$EXPECTED_POD_NAME' not found in namespace '$EXPECTED_NAMESPACE'."
fi
