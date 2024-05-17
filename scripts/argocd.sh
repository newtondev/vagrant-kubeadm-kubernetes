#!/bin/bash
#
# Deploys the ArgoCD when enabled in settings.yaml

set -euxo pipefail

sudo -i -u vagrant kubectl kustomize /vagrant/manifests/argocd --enable-helm | kubectl apply -f -

sleep 5

# Do it again due to CRDs that might not have been applied
sudo -i -u vagrant kubectl kustomize /vagrant/manifests/argocd --enable-helm | kubectl apply -f -
