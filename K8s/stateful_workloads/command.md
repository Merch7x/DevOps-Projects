### Create cluster
### Deploy mongodb helm chart
`helm repo add bitnami https://charts.bitnami.com/bitnami`
`helm update`
`helm install <release_name> -f test-mongodb-values.yaml bitnami/mongodb`

### Deploy ingress Contorller
`helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx-ingress ingress-nginx/ingress-nginx --set controller.publishService.enabled=true`

### Deploy Mongo-express deployment
kubectl apply -f test-mongo-express.yaml

### Create ingress rule
Kubectl apply -f test-ingress.yaml