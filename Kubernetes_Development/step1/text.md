# Environment Variables in Kubernetes:
Environment variables are **key-value** pairs that store configuration information accessible to processes within a pod. They provide a way to customize application behavior without modifying the container image itself, making deployments more flexible and maintainable.

## Where to Configure them in Pods?
There are three primary ways to configure environment variables for pods:
1. Directly in the Pod Manifest
2. Using ConfigMaps
3. Using Secrets

<br>

# Directly in the Pod Manifest

This is the simplest approach, suitable for simple configurations. You use the env field within the container definition to specify key-value pairs.
<br>

``` yaml
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - name: nginx
    image: nginx:latest
    env:
    - name: my-env
      value: new-enviroment
```
<br>

When you create the pod the enviroment variable is also created within the pod and you can view it 

```bash
kubectl describe pod mypod
```
<br>

# Task

Create a pod with the name *mypod* and with an enviroment variable named *my-env* and value *new-enviroment* in the *env* namespace.