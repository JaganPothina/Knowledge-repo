# Makefile for managing a kind cluster and deployment
 
KIND_CLUSTER_NAME = jagan-cluster
KIND_CONFIG = jagan.yaml
 
# Create kind cluster	
create-cluster:	
	kind create cluster --name $(KIND_CLUSTER_NAME) --config $(KIND_CONFIG)	
 
# Delete the kind cluster
delete-cluster:	
	kind delete cluster --name $(KIND_CLUSTER_NAME)
 
# Install nginx ingress controller
install-ingress:	
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
 
# check pod status
check-pods:	
	kubectl get pods -A
 
# clean up
destroy:	
	make delete-cluster
 
PHONY: create-cluster delete-cluster install-ingress check-pods destroy
