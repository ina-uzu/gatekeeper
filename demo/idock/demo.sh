#!/bin/bash

. ../../third_party/demo-magic/demo-magic.sh

clear

pe "kubectl apply -f sync.yaml"

pe "kubectl apply -f templates/k8sallowedrepo_template.yaml"

pe "kubectl apply -f constraints/allowed-repos.yaml"

pe "kubectl apply -f templates/k8scontainerlimits_template.yaml"

pe "kubectl apply -f constraints/container-must-have-limit.yaml"

pe "kubectl apply -f good/deploy.yaml"

pe "kubectl apply -f bad/deploy-not-allowed-reg.yaml"

pe "kubectl apply -f bad/deploy-limit-over.yaml"

pe "kubectl apply -f bad/deploy-no-limit.yaml"

p "THE END"


kubectl delete -f sync.yaml
kubectl delete -f templates/k8sallowedrepo_template.yaml
kubectl delete -f constraints/allowed-repos.yaml 
kubectl delete -f templates/k8scontainerlimits_template.yaml
kubectl delete -f constraints/container-must-have-limit.yaml 

kubectl delete -f good/deploy.yaml
kubectl delete -f bad/deploy-not-allowed-reg.yaml
kubectl delete -f bad/deploy-no-limit.yaml
kubectl delete -f bad/deploy-limit-over.yaml