KIND_CLUSTER_NAME = jagan-cluster
KIND_CONFIG = kind-cluster.yaml
WORDPRESS_APP= wordpress
 
# Create kind cluster
create-cluster:
        kind create cluster --name $(KIND_CLUSTER_NAME) --config $(KIND_CONFIG)
 
# Delete the kind cluster
delete-cluster:
        kind delete cluster --name $(KIND_CLUSTER_NAME)
 
# Install nginx ingress controller
install-ingress:
        kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
 
# Deploy wordpress
deploy-wordpress:
        kubectl apply -f $(WORDPRESS_APP)
 
# check pod status
check-pods:
        kubectl get pods -A
 
# clean up
destroy:
        make delete-cluster
 
PHONY: create-cluster delete-cluster install-ingress check-pods destroy
 
                                                                                                    
has context menu

