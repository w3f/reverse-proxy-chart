#!/bin/bash

source /scripts/common.sh
source /scripts/bootstrap-helm.sh


run_tests() {
    echo Running tests...
}

teardown() {
    helm delete reverse-proxy
}

main(){
    if [ -z "$KEEP_W3F_REVERSE_PROXY" ]; then
        trap teardown EXIT
    fi

    /scripts/build-helm.sh \
        --set environment=ci \
        reverse-proxy \
        ./charts/reverse-proxy

    run_tests
}

main
