set -e

NAME="devops-kubernetes-api"
USERNAME="abhay0103"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker Image ..."
docker build -t $IMAGE .

echo "Pusing Image  To Docker Hub ..."
docker push $IMAGE

echo "Applying Kubernetes manifests ..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting Pods ..."
kubectl get pods

echo "Getting Services ..."
kubectl get services

echo "Fetching the main service"
kubectl get services $NAME-service

