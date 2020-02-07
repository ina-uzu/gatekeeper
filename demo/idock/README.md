kubectl apply -f sync.yaml

kubectl apply -f templates/k8sallowedregistry_template.yaml

kubectl apply -f constraints/allowed-registries.yaml 

kubectl apply -f good/image.yaml

kubectl apply -f bad/wrong-image.yaml

kubectl delete -f sync.yaml

kubectl delete -f templates/k8sallowedregistry_template.yaml

kubectl delete -f constraints/allowed-registries.yaml 

kubectl delete -f good/image.yaml

kubectl delete -f bad/wrong-image.yaml

