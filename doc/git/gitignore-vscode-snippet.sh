#!/bin/bash

# gitignore-vscode-snippet.sh
# ---------------------------
# Get a gitignore template from github/gitignore, and convert it to VS Code snippet.
#
# Author: OpenJNY (twiiter: @openjny, github: OpenJNY)
# Date: 2018/12/13
# Usage:
# $ ./gitignore-vscode-snippet.sh <Language> [<Prefix Name>]
# Example:
# $ ./gitignore-vscode-snippet.sh Python
# $ ./gitignore-vscode-snippet.sh C++ cpp
# $ ./gitignore-vscode-snippet.sh TeX latex


language="$1" # e.g. Python, C++, etc
if [ -z "$language" ]; then
    echo "[ERROR] Specify the language through the 1-st argument."
    exit 1
fi

prefix=$2 # specifies the prefix of this snippet.
if [ -z "$prefix" ]; then
    prefix=$(echo $language | awk '{print tolower($0)}')
fi

with_dquote() {
    echo "\"$@\""
}

url="https://raw.githubusercontent.com/github/gitignore/master/${language}.gitignore"
tmpfile="/tmp/gitignore_snippet_${language}.gitignore"

wget -q $url -O $tmpfile
if [ $? -ne 0 ]; then
    echo "[ERROR] Couldn't get gitignore template (lang=$language)"
    exit 1
fi

echo -n $(with_dquote "ignore $language") ": {"
echo -n $(with_dquote "prefix") ":" $(with_dquote "$prefix") ","
echo -n $(with_dquote "body") ": ["
echo -n $(cat "$tmpfile" | awk '{print "\042" $0 "\042,"}')
echo -n $(with_dquote "")
echo -n "],"
echo -n $(with_dquote "description") ":" $(with_dquote "Add ignore files of $language project (ref. github/gitignore)")
echo "},"

rm -f $tmpfile