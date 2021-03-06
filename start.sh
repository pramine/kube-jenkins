#!/bin/bash
SERVICE_TYPE_STRING=""
if [[ "$1" == "minikube" ]]; then
    shift
    echo "Launching with a NodePort instead of a LoadBalancer"
    SERVICE_TYPE_STRING="--set Master.ServiceType=NodePort"
    helm install --name gus-test-jenkins -f helm/custom-values-minikube.yaml ${SERVICE_TYPE_STRING} helm/jenkins $*
else
    helm install --name gus-test-jenkins -f helm/custom-values.yaml ${SERVICE_TYPE_STRING} helm/jenkins $*
fi