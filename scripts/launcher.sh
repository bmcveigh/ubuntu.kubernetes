# Launches Minikube on Ubuntu Desktop.
#
# This also opens the dashboard in the browser.

minikube start

# TODO: dynamically add the services.
cd stacks/drupal/kubernetes
minikube kubectl -- apply -f cli-deployment.yaml,cli-service.yaml,db-deployment.yaml,db-service.yaml,web-deployment.yaml,web-service.yaml

echo "Below are the application endpoints that can be accessed in the browser..."
minikube service web --url

minikube dashboard
