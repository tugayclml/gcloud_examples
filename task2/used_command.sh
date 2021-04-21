# Login with gcloud after installing google cloud sdk
gcloud auth login

# Kubernetes Cluster created with 2 nodes on Google Cloud Console
# Get credentials and it will create .kube files
gcloud container clusters get-credentials --zone=europe-west1-b --project=causal-binder-311318 gcpcluster

# Get cluster nodes
kubectl get nodes

# Google Container Registry enabled from Google Cloud Console

# Add username to docker security group
sudo usermod -a -G docker ${USER},

# Configure Google Container Registry 
gcloud auth configure-docker

# cd into app folder
cd /app

# create image for flask app
docker build -t gcr.io/causal-binder-311318/flaskapp .

# create tag for created image
docker tag gcr.io/causal-binder-311318/flaskapp gcr.io/causal-binder-311318/flaskapp:v1

# I get some error for configuring docker after then run this command again it works.
gcloud auth configure-docker

# Push image to Google Container Registry its returning permission error on my situation 
# I run this again "gcloud auth configure-docker", it solve the problem
docker push gcr.io/causal-binder-311318/flaskapp:v1

# Back to task2 folder and cd into the kubernetes_yamls folder
cd .. 
cd kubernetes_yamls

# I created app_deployment.yaml and app_service.yaml
# Apply these files
kubectl apply -f app_deployment.yaml
kubectl apply -f app_service.yaml

# Check the pods, deployments and services with more information (-o wide)
# It returns all pods, deployments and services on cluster with default namespace
kubectl get all -o wide

# I setup nginx-ingress with helm
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

helm install nginx-ingress nginx-stable/nginx-ingress

# Wait a few minutes and then check the services. The Ingress create loadbalancer and we can see external ip from response
kubectl get services

# I created nginx-ingress.yaml
kubectl apply -f nginx-ingress.yaml

# Test 
# curl http://35.195.249.235.xip.io -> It returns {"status": 200, "message": "Welcome to my app!"}
# curl http://35.195.249.235.xip.io/status -> It returns 404 
# If you don't have curl, you should install 
# If you are using ubuntu or debian package, you can install with this commands
# sudo apt update && sudo apt upgrade
# sudo apt install curl
# Check the curl version "curl --version"
curl http://EXTERNAL_IP.xip.io