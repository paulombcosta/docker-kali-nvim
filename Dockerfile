FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get install -y software-properties-common \
python-dev python-pip python3-dev python3-pip python python-setuptools python-pip curl zsh git wget cmake \
libtool libtool-bin autoconf automake cmake g++ pkg-config unzip libmsgpack-dev libuv-dev libluajit-5.1-dev \
libncurses5-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libxt-dev libxpm-dev libx11-dev ruby-dev 

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

# Building vim
WORKDIR /opt
RUN git clone https://github.com/vim/vim.git
WORKDIR vim

RUN ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
RUN make VIMRUNTIMEDIR=/usr/share/vim/vim74
RUN make install

WORKDIR /root/workspace

ENV TERM=xterm-256color

CMD ["/bin/zsh"]
