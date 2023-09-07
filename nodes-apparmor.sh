#!/usr/bin/env bash

NODES=(
    # The SSH-accessible domain names of your nodes
    minikube
    minikube-m02)
for NODE in ${NODES[*]}; do minikube ssh $NODE 'sudo apparmor_parser -q <<EOF
#include <tunables/global>

profile k8s-apparmor-example-deny-write flags=(attach_disconnected) {
  #include <abstractions/base>

  file,

  # Deny all file writes.
  deny /** w,
}
EOF'

done

exit 0
