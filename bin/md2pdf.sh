#!/usr/bin/env bash
#
# md2pdf.sh
# ---------
# Converter that creates pdf from markdown using pandoc
#
# Author: OpenJNY
# Date: 2019/02/19
# Requirements:
# * pandoc
# * latex (xatex)

# 埋め込みフォント
font="HiraginoSans-W4"

# 入力 (markdown)
src="$1"
[[ -n "$src" && -f "$src" ]] || {
    echo "Invalid source (markdown) was specified."
    exit 1
}

# 出力 (pdf)
dst="$2"
if [ -z "$dst" ]; then
    dst="${src%.*}.pdf"
fi

head="$(head $src -n 1)"
if [ "$head" == "---" ]; then
    echo "Found yml header in the markdown file!"
else
    title=$(grep -E "^#[^#]" "$src" | sed -E 's/#+\s(.+)/\1/g' | head -n 1)
    if [ -n "$title" ]; then
        read  -p "Do you want to use \"${title}\" as the title? [Y/n]: " answer
        case ${answer:0:1} in
            n|N ) title="" ;;
            * ) ;;
        esac
    fi
    while [ -z "$title" ]; do
        read -p "Please input the title: " title
    done

    author=""
    while [ -z "$author" ]; do
        read -p "Please input the author: " author
    done

    date=$(date -r $src "+%Y/%m/%d")

    yaml="---
title: \"${title}\"
author: \"${author}\"
date: \"${date}\"
titlepage: true
titlepage-color: \"243b72\"
titlepage-text-color: \"ffffff\"
---"

    echo "****************************"
    echo "Add yaml header as follows:"
    echo "$yaml"
    echo "****************************"

    tmpfile="$(mktemp).md"
    echo "$yaml" > $tmpfile
    echo "" >> $tmpfile
    cat "$src" >> $tmpfile
    src="$tmpfile"
fi

# template="$(dirname $0)/eisvogel.tex"
template="/tmp/eisvogel.tex"
if [ ! -f "$template" ]; then
    mkdir -p "$(dirname $template)"
    wget -q "https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex" -O "${template}"
fi

pandoc "$src" -o "$dst" --from markdown --template "${template}" --listings --pdf-engine=xelatex -V lang=en-us -V CJKmainfont=\"$font\"

# お片付け
[ -f "$tmpfile" ] && rm -f $tmpfile