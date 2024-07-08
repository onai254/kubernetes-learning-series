#!/bin/bash

if kubectl get nodes -l environment=production ; then
  echo "Validation successful. Nodes with the specified label found."
  exit 0
else
  echo "Validation failed. No nodes with the specified label found."
  exit 1
fi
