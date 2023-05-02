## Transform kubeconfig output to a yaml Kubeconfig file to set cluster context
`export KUBE_VAR=`terraform output kubeconfig` && echo $KUBE_VAR | base64 -di > lke-cluster-config.yaml`

## Set KUBECONFIG VAR
`export KUBECONFIG=lke-cluster-config.yaml`

## Make sure the cluster-context is set
`kubectl config get-contexts`

## Confirm nodes
`kubectl get nodes`