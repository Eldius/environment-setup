#!/bin/bash

echo "installing testcmd..."
cat <<EOF >> ~/.bashrcd

## pyenv
export PATH="\$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init --path)"
eval "\$(pyenv virtualenv-init -)"

EOF
