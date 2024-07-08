# ConfigMaps as Volumes

Passing configuration options as environment variables or command-line arguments is usually used for a short variable value. When you want to expose ConfigMaps to a container, you can use one of the special volume types.
A configMap volume will expose each entry of the ConfigMaps as a file. The process running in the container can obtain the entry's value by reading the contents of the file.

## Creating a configmap from a directory
First lets create a directory named **config** with files configfile1 and configfile2 containing config_value1=value1 and config_value2=value2

``` bash
mkdir config
cd config
touch configfile1
```
<br>

After creating the directory and the config files lets now create the configMap

``` bash
kubectl create configmap configdir --from-file=config/
```

The configmap is now created we can view it using the describe command 

``` bash
kubectl describe configmap configdir
```
<br>

Lets also create the config volume pod called ConfigVol

``` yaml
apiVersion: v1
kind: Pod
metadata:
  name: configVol
  labels:
    name: config
spec:
  containers:
  - name: ConfigVol
    image: gcr.io/google-samples/node-hello:1.0
    volumeMounts:
    - name: config-volume
      mountPath: /etc/config
  volumes:
  - name: config-volume
    configMap:
      name: configdir
```

Apply the Yaml file and exec into the pod,

``` bash
kubectl exec configVol -it -- bash
```
Check the contents in the config directory in the running pod

``` bash
ls -l /etc/config
```

You can  easily view the contents in the configfile1

``` bash
cat etc/config/configfile1
```

In this demonstration we have learned how to acess data within a configmap inside a container