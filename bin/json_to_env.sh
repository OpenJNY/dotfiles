#!/bin/sh

# https://qiita.com/arc279/items/3e88bc668987927c03d6
# stdinから受け取ったjsonを環境変数にexport
export $(jq -r 'keys[] as $k | "\($k)=\(.[$k])"')
