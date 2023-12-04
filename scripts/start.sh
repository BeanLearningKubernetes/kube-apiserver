#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ASSETS_DIR="${SCRIPT_DIR}/../assets/"

go run "${SCRIPT_DIR}/../cmd/kube-apiserver" --client-ca-file ${ASSETS_DIR}/client-ca.crt \
                             --cert-dir ${ASSETS_DIR} \
                             --tls-cert-file ${ASSETS_DIR}/server.crt \
                             --tls-private-key-file ${ASSETS_DIR}/server.key \
                             --etcd-servers http://127.0.0.1:2379 \
                             --service-account-issuer https://127.0.0.1:6443 \
                             --service-account-signing-key-file ${ASSETS_DIR}/server.key \
                             --service-account-key-file ${ASSETS_DIR}/server.key