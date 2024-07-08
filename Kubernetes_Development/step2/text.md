# ConfigMaps

ConfigMaps are externalized configuration files which are accessible by your applications within the pods. They offer a centralized way to manage **non-sensitive data**, promoting cleaner code, easier deployments, and a more streamlined development workflow.

<br>

### ConfigMap Properties

``` yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-configmap
data:
  property_like_key_1: value1
  property_like_key_2: value2

  file_like_key: |
    config_option_1=config_value_1
    config_option_2=config_value_2

binarydata:
  some_config_file : <base_64_encoded_data>

```
<br>

Data is stored in a ConfigMap in **data** and/or **binaryData** sections. 
1. The **data** section contains *UTF-8* formatted data. 
2. The **binaryData** section contains *base64* encoded data. 

<br>

ConfigMaps can contain *property-like* keys and/or *file-like* keys.
1. Property like keys are simple single line key-value pairs. 
2. File-like keys are multi-line arrays of values. 

<br>

## Creating a ConfigMap 

You can create a configmap using the kubectl command approach or with the yaml. Configmaps usually contains more than one entry. To create a configMap with multiple literal entries, you add multiple **--from-literal** arguments 

Creating ConfigMaps decleratively 

``` bash
kubectl create configmap myconfigmap --from-literal=foo=bar --from-literal=bar=baz --from-literal=one=two

```

<br>

We can then view the configmap created.

``` bash

kubectl describe configmap myconfigmap

```
Nothing much there we could have written a yaml file to archive this.

<br>

## Creating a configMap from files in a directory

Instead of importing each file individually you can even import all files from a file directory


``` bash

kubectl create configmap my-config --from-file=/path/to/dir

```
When creatigng configMaps you can use different combinations like


``` bash
kubectl create configmap my-config |
  --from-file=foo.json
  --from-file=bar=foobar.conf
  --from-file=config-opts/
  --from-file=some=thing
```

