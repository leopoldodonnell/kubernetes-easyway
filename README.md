# Kubernete, the Easy Way

**UNDER CONSTRUCTION** Come back later or watch this repo for updates

While there are many reasons you may want to install Kubernetes the hard way, it doesn't have to be that hard. Google Cloud and Azure already have easy solutions to deploying a Kubernetes cluster with Amazon soon to join them.

*Kubernetes, the Easy Way* is a project to provide an *Infrastructure As Code* solution to managing your clusters via code and git.

* Supports GKE and AKS (will support EKS when available)
* Provides a central manifest of your clusters
* Offers Prometheus/Grafana monitoring from an Ops Node Group
* Offers Elasticsearch/Fluentd/Kibana Log Monitoring from an Ops Node Group

## TL;DR

## Design

## Cluster YML

* kind
* apiVersion
* metadata
* region
* backend
* provider
* kubernetes

### metadata

### backend

### provider

### kubernetes

## NOTES

- need to add a volume for /mthome/.azure for access locally, not just in the az command
- the tutorial works to create a cluster: https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-deploy-cluster
- need to use the following to get the kubernetes config

```bash
az aks get-credentials --resource-group=myResourceGroup --name=myAKSCluster -f - > kubeconfig
```

Use it

```bash
export KUBECONFIG=$PWD/kubeconfig kubectl get nodes
```

Access the dashboard at http://localhost:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/#!/overview?namespace=default

```bash
# Don't run this from inside multi-tool since localhost won't be the same as what your browser is using
export KUBECONFIG=$PWD/kubeconfig kubectl proxy
```

** Google KUBECONFIG **

To setup KUBECONFIG for google you need to make the cluster project current

```bash
multi-tool gcloud config set project {cluster project id}
```

Then you can setup the config file using
```bash
multi-tool gcloud container clusters get-credentials {CLUSTER NAME} --zone={PRIMARY ZONE}
```

Set `KUBECONFIG` if you want to use a file other than `~/.kube/config` for the credentials

Both `CLUSTER_NAME` and `PRIMARY_ZONE` can be retrieved as follows:
```bash
cd clusters/{cluster dir}
multi-tool terraform output cluster_name
multi-tool terraform output primary_zone
```
