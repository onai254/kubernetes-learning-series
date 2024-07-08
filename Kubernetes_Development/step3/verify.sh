#!/bin/bash

# Check if the ConfigVol pod exists
pod_exists=$(kubectl get pods | grep ConfigVol)

if [ -z "$pod_exists" ]; then
    echo "Error: ConfigVol pod not found."
    exit 1
else
    echo "ConfigVol pod found."
fi

# Check if the ConfigMap named configdir exists
configmap_exists=$(kubectl get configmaps | grep configdir)

if [ -z "$configmap_exists" ]; then
    echo "Error: ConfigMap named configdir not found."
    exit 1
else
    echo "ConfigMap named configdir found."
fi

echo "Verification successful: ConfigVol pod and ConfigMap named configdir exist."
exit 0
