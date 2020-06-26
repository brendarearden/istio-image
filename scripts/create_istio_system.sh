#!/bin/bash
istioctl version
istioctl install -f /app/istio-base.yaml
istioctl verify-install -f /app/istio-base.yaml
