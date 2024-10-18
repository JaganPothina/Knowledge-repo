# Makefile for managing a kind cluster and deployment
 
KIND_CLUSTER_NAME = jagan-cluster
KIND_CONFIG = jagan.yaml
 
# Create kind cluster	
create-cluster:	
	kind create cluster --name $(KIND_CLUSTER_NAME) --config $(KIND_CONFIG)	
 
# Install nginx ingress controller
install-ingress:	
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
 
# check pod status
check-pods:	
	kubectl get pods -A

# Delete the kind cluster
delete-cluster:
	kind delete cluster --name $(KIND_CLUSTER_NAME)

# clean up
destroy:	
	make delete-cluster
 
PHONY: create-cluster install-ingress check-pods delete-cluster destroy
