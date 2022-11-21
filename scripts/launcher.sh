# Launches Minikube on Ubuntu Desktop.
#
# This also opens the dashboard in the browser.

minikube start

# TODO: dynamically add the services.
cd stacks/drupal/kubernetes
minikube kubectl -- apply -f cli-deployment.yaml,cli-service.yaml,db-deployment.yaml,db-service.yaml,web-deployment.yaml,web-service.yaml,solr-deployment.yaml,solr-service.yaml

echo "Drupal endpoints..."
minikube service web --url
echo "Solr endpoints..."
minikube service solr --url

minikube dashboard
