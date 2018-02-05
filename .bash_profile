
export PATH=$PATH:/usr/local/cuda/bin

function setlang_jp() {
  export LANG=ja_JP.UTF-8
  export LANGUAGE=ja_JP.ja
  export LC_ALL=ja_JP.UTF-8
}

function setlang_en() {
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US:en
  export LC_ALL=en_US.UTF-8
}

lang=$(locale -a 2> /dev/null | grep -E "(ja_JP.UTF-8|ja_JP.utf8)" | head -n 1)
if [ $? -eq 0 ]; then
  echo $lang
  export LANG=${lang}
  export LC_ALL="${lang}"
else
  # There was no japanese locale; thus set english location."
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US:en
  export LC_ALL=en_US.UTF-8
fi
