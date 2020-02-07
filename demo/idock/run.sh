#!/bin/bash

# deploy gatekeeper
# kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml

kubectl apply -f sync.yaml

kubectl apply -f templates/k8sallowedrepo_template.yaml
kubectl apply -f constraints/allowed-repos.yaml 
kubectl apply -f templates/k8scontainerlimits_template.yaml
kubectl apply -f constraints/container-must-have-limit.yaml 


kubectl apply -f good/deploy.yaml
kubectl apply -f bad/deploy-not-allowed-reg.yaml
kubectl apply -f bad/deploy-no-limit.yaml
kubectl apply -f bad/deploy-limit-over.yaml

kubectl delete -f sync.yaml
kubectl delete -f templates/k8sallowedrepo_template.yaml
kubectl delete -f constraints/allowed-repos.yaml 
kubectl delete -f templates/k8scontainerlimits_template.yaml
kubectl delete -f constraints/container-must-have-limit.yaml 

kubectl delete -f good/deploy.yaml
kubectl delete -f bad/deploy-not-allowed-reg.yaml
kubectl delete -f bad/deploy-no-limit.yaml
kubectl delete -f bad/deploy-limit-over.yaml