#!/bin/bash
if kubectl get --ignore-not-found=true configmap istio-operator-cr-overlay -n istio-system 
then 
    istioctl manifest generate -f /app/istio-base.yaml -f /app/overlay-config.yaml | kubectl delete -f -
else 
    istioctl manifest generate -f /app/istio-base.yaml | kubectl delete -f -
kubectl delete namespace istio-system