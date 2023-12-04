#!/usr/bin/env bash

if [ -d './kubernetes' ]; then
  echo $(cd kubernetes && git pull)
else
  git clone git@github.com:kubernetes/kubernetes.git
fi

KUBE_CLONE=./kubernetes

mkdir -p ./cmd
# cp -R ${KUBE_CLONE}/cmd/kube-apiserver ./cmd/
cp -R ${KUBE_CLONE}/cmd/* ./cmd/

STAGING=staging/src/k8s.io
mkdir -p ./staging/src/k8s.io

# cp -R ${KUBE_CLONE}/${STAGING}/api ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/apiextensions-apiserver ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/apimachinery ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/apiserver ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/cli-runtime ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/client-go ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/cloud-provider ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/cluster-bootstrap ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/code-generator ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/component-base ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/component-helpers ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/controller-manager ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/cri-api ${STAGING}
# cp -R ${KUBE_CLONE}/${STAGING}/kms ${STAGING}

cp ${KUBE_CLONE}/go.mod ./
cp -R ${KUBE_CLONE}/${STAGING}/* ${STAGING}

PKG=pkg
mkdir -p pkg
# cp -R ${KUBE_CLONE}/${PKG}/api ${PKG}
# cp -R ${KUBE_CLONE}/${PKG}/controlplane ${PKG}
# cp -R ${KUBE_CLONE}/${PKG}/registry ${PKG}
# cp -R ${KUBE_CLONE}/${PKG}/securitycontext ${PKG}
cp -R ${KUBE_CLONE}/${PKG}/* ${PKG}

TEST=test
mkdir -p ${TEST}
cp -R ${KUBE_CLONE}/${TEST}/* ${TEST}

PLUGIN=plugin
mkdir -p ${PLUGIN}
cp -R ${KUBE_CLONE}/${PLUGIN}/* ${PLUGIN}

THIRD=third_party
mkdir -p ${THIRD}
cp -R ${KUBE_CLONE}/${THIRD}/* ${THIRD}

go mod tidy