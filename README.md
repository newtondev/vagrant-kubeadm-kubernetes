# Vagrant Kubeadm Kubernetes

A fully automated setup for Kubernetes practice labs.

If you are MAC Silicon user, Please use the follwing repo.

* [Vagrant Kubeadm Setup on MAC Silicon](https://github.com/techiescamp/vagrant-kubeadm-mac-silicon)

## Prerequisites

* A working Vagrant setup using Vagrant + VirtualBox

Create/edit the /etc/vbox/networks.conf file and add the following to avoid any network-related issues:

```shell
* 0.0.0.0/0 ::/0
```

## Bring up the cluster

```shell
vagrant up
```

## Set kubeconfig file variable

```shell
cd configs
export KUBECONFIG=$(pwd)/config
```

or you can copy the config file to your .kube directory:

```shell
cp config ~/.kube/
```

## Install Kubernetes Dashboard

The dashboard is automatically installed by default, but it can be skipped by commmenting out the dashboard version in *settings.yaml* before running `vagrant up`.

If you skip the dashboard installtion, you can deploy it later by enabling it in *settings.yaml* and running:

```shell
vagrant ssh -c "/vagrant/scripts/dashboard.sh" controlplane
```

## Kubernetes Dashboard Access

To get the login token, copy it from `config/token` or run the command:

```shell
kubectl -n kubernetes-dashboard get secret/admin-user -o go-template="{{.data.token | base64decode}}"
```

Make the dashboard accessible:

```shell
kubectl proxy
```

Open the site in your browser:

```shell
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
```

## To shutdown the cluster

```shell
vagrant halt
```

## To restart the cluster

```shell
vagrant up
```

## To destroy the cluster

```shell
vagrant destroy -f
```
