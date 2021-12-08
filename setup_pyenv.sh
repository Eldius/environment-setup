#!/bin/bash

echo "installing pyenv..."
sudo apt-get -y install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev && \
curl https://pyenv.run | bash

cat <<EOF >> ~/.bashrc

## pyenv
export PATH="\$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init --path)"
eval "\$(pyenv virtualenv-init -)"

EOF
