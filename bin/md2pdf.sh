#!/usr/bin/env bash

src="$1"
[ -n "$src" ] || {
    echo "The source (markdown) must be specified."
    exit 1
}

dst="$2"
if [ -z "$dst" ]; then
    dst="${src%.*}.pdf"
fi

template=$(readlink -f $(dirname $0)/pandoc-templates/eisvogel.tex)
pandoc "$src" -o "$dst" --from markdown --template "${template}" --listings --pdf-engine=xelatex -V lang=en-us -V CJKmainfont=\"HiraginoSans-W4\" 