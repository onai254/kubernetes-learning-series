### Accessing Secret as Volume mounts


 In Kubernetes, **Labels** serve as metadata that can be affixed to various API objects, with pods being a common example, to denote identity or specific characteristics. These labels can either be defined within manifests or assigned manually based on your requirements. 
<br>
Labeling a Node
<br>
To add a label to a node in a Kubernetes cluster, you can use the following imperative command.

<br>

```bash

kubectl label nodes node01 environment=production `

```

### Selectors
**Selectors** play a vital role within kubectl, enabling the querying of API objects that utilize labels. These selectors empower you to perform various actions, from straightforward retrieval commands to more complex operations like deletion, specifically targeting objects that match the defined label-based criteria.

<br>
Selecting nodes
To query nodes based on a specific label, you can use the following imperative command. 

```bash
kubectl get nodes -l environment=production
```
This will querry the node with the label production environment=production