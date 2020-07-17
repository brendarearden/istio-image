#!/bin/bash
istioctl version
if kubectl get --ignore-not-found=true deploy istiod -n istio-system
then
    if [ ${APPLY_OVERLAY_CONFIG} = "true" ]
    then
        echo "Running istioctl upgrade with overlay"
        istioctl upgrade -y  -f /app/istio-base.yaml -f /app/overlay-config.yaml
    else 
        echo "Running istioctl upgrade"
        istioctl upgrade -y  -f /app/istio-base.yaml
    fi
    istioctl verify-install -f /app/istio-base.yaml
    
else
    if [ ${APPLY_OVERLAY_CONFIG} = "true" ]
    then
        echo "Running istioctl install with overlay"
        istioctl install -y  -f /app/istio-base.yaml -f /app/overlay-config.yaml
    else 
        echo "Running istioctl install"
        istioctl install -y -f /app/istio-base.yaml
    fi
    istioctl verify-install -f /app/istio-base.yaml
fi 
