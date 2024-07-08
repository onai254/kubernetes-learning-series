# Working with Secrets

Secrets enable the secure storage of sensitive information within a Kubernetes cluster, including but not limited to: 
1. Usernames
2. Passwords
3. Encryption keys
4. Certificates

## How are Secrets Accessed? 
1. Files in a Volume:
2. Environment Variables
3. kubelet ImagePullSecret Field

<br>

## Secret Types 
When establishing a secret, you have the option to designate its type. Kubernetes offers a range of predefined secret types, each serving a distinct purpose:

1. **Opaque**: This type accommodates arbitrary user-defined data.
2. **Service-account-token**: Specifically designed for ServiceAccount tokens.
3. **Dockercfg**: Represents the serialized content of the ~/.dockercfg file.
4. **Dockerconfigjson**: Corresponds to the serialized content of the ~/.docker/config.json file.
5. **Basic-auth**: Intended for storing credentials used in basic authentication.
6. **SSH-auth**: Tailored for holding credentials relevant to SSH authentication.
7. **TLS**: Contains data pertinent to TLS clients or servers.
8. **Token**: Serves as a container for bootstrap token data.

<br>

# Create a Generic opaque Secret

The type opeque is the default type of secret
Any type of data can be stored in an opeque secret
Data can be input as files or supplied as iterals on the command line

### Command

``` bash
kubectl create secret generic mysecret1 --from-file=mysecret1.txt
```

<br>

# Creating a basic-auth secret
The basic-auth secret type in Kubernetes demands specific key names when creating keys, namely *username* and *password.* It is imperative that values stored in these keys must be base64 encoded to ensure secure handling of sensitive information.


``` yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  username: YWRtaW4=
  password: cGFzc3dvcmQ=
```

Creating from the command line

```bash
echo -n "user2" | base64
echo -n "password2" | base64

kubectl create secret generic mysecret2 --from-literal=username=USER2_BASE64 --from-literal=username=PASSWORD2_BASE64
```

# Creating a TLS secret
To generate a TLS secret in Kubernetes, the type tls mandates the use of specific key names during creation—namely, **tls.crt** for the certificate and **tls.key** for the key. 
It's essential that the certificate is in PEM format, and the key must be a PKCS#8 key in DER format.


``` yaml
apiVersion: v1
kind: Secret
metadata:
  name: tls-secret
type: kubernetes.io/tls
data:
  tls.crt: BASE64_ENCODED_CERTIFICATE   
  tls.key: BASE64_ENCODED_PRIVATE_KEY   
```

From the commandline you can create a tls secret

```bash
kubectl create secret tls my-tls-secret --cert=path/to/cert/file --key=path/to/key/file
```

### listing secrets

``` bash
kubectl get secrets
```

### describing secrets
``` bash
kubectl describe secret
```
