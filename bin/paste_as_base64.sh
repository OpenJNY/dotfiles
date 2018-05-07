#!/bin/bash

a="![](data:image/png;base64,"
b=$(pngpaste - | base64)
c=")"

echo $a$b$c
