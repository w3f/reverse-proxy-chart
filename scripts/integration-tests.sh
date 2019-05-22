#!/bin/bash

source /scripts/common.sh
source /scripts/bootstrap-helm.sh


run_tests() {
    echo Running tests...
}

teardown() {
    helm delete --purge polkadot-wiki
}

main(){
    if [ -z "$KEEP_W3F_POLKADOT_WIKI" ]; then
        trap teardown EXIT
    fi

    /scripts/build-helm.sh \
        --set environment=ci \
        polkadot-wiki \
        ./charts/polkadot-wiki

    run_tests
}

main
