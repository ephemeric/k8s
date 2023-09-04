## Commands

kubectl get configMap kubeadm-config -o yaml --namespace=kube-system

kubectl get pods -A -l k8s-app=metrics-server

## TODO

`kubeadm config images pull --kubernetes-version=1.27.5` will prevent `remote version is much newer`.

The 2 lines `fetching Kubernetes version from` are debug `--v=5`.

I0901 09:47:53.233417   21716 version.go:187] fetching Kubernetes version from
URL: https://dl.k8s.io/release/stable-1.txt
I0901 09:47:54.126055   21716 version.go:256] remote version is much newer:
v1.28.1; falling back to: stable-1.27
I0901 09:47:54.126108   21716 version.go:187] fetching Kubernetes version from
URL: https://dl.k8s.io/release/stable-1.27.txt
W0901 09:47:55.121934   21716 images.go:80] could not find officially supported
version of etcd for Kubernetes v1.27.5, falling back to the nearest etcd version
(3.5.7-0)

## Pull Through Proxy

Control DNS for `registry.k8s.io` and `no_proxy`:

- `/etc/hosts`

## Private Registry

`kubeadm config images pull --image-repository=registry.ephemeric.lan`

## Deploy

Private registry I suppose, pull-through-proxy in `/etc/docker/daemon.json` has no effect and rightly so as `docker` in not installed.
