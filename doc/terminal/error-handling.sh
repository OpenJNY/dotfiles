#!/bin/bash

die() {
    echo "${1}" >&2 # send to stderr
    exit "${2:-1}" # default error code: 1
}

url="hogehoge"
wget -c url || die "Fail to download ${url}"