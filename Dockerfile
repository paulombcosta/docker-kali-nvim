FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get install -y software-properties-common python-software-properties \
python-dev python-pip python3-dev python3-pip python python-setuptools python-pip curl zsh git wget cmake \
libtool libtool-bin autoconf automake cmake g++ pkg-config unzip libmsgpack-dev libuv-dev libluajit-5.1-dev

RUN pip install github3.py

# Zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Building nvim
WORKDIR /opt
RUN git clone https://github.com/neovim/neovim.git
WORKDIR neovim
RUN make && make install

# Required from some plugins
RUN pip3 install neovim

WORKDIR /root/workspace

ENV TERM=xterm-256color

CMD ["/bin/zsh"]
