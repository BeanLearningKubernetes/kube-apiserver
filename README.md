# kube-apiserver

## Prerequisites
1. install Go v1.21+
2. install etcd

## Getting started
1. Start etcd
```shell
etcd
```
2. Get dependencies
```shell
make init
```
3. Start the local server
```shell
make local
```

Test if the local server is up and running:
```shell
k --kubeconfig ./assets/.kubeconfig.sample  get ns
```
or 
```shell
curl -fv -k --cert-type P12 --cert ./assets/client.p12:password -XGET \
    -H "Accept: application/json;as=Table;v=v1;g=meta.k8s.io,application/json;as=Table;v=v1beta1;g=meta.k8s.io,application/json"  \
    'https://localhost:6443/api/v1/namespaces?limit=500'
```

```shell
   curl -fv -k --cert-type P12 --cert ./assets/client.p12:password https://localhost:6443/api
```
