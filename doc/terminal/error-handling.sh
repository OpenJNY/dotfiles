#!/bin/bash

function die () {
    echo "${@}"
    exit 1
}

url="hogehoge"
wget -c url || die "Fail to download ${url}"