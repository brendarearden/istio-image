#!/bin/bash
istioctl version
if kubectl get pods --namespace=istio-system | grep istiod
then
    echo "Running istioctl upgrade"
    istioctl upgrade -y  -f /app/istio-base.yaml
    istioctl verify-install -f /app/istio-base.yaml
else
    echo "Running istioctl install"
    istioctl install -y -f /app/istio-base.yaml
    istioctl verify-install -f /app/istio-base.yaml
fi 
if [ ${APPLY_OVERLAY_CONFIG} = true ]
then
    echo "Overlay configuration detect - running istioctl install"
    istioctl install -f /app/overlay-config.yaml
fi
