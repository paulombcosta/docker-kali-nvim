# Docker Kali + nvim

# Introduction

Basic docker image that extends from kali and installs zsh and neovim

# Setup

Replace the following files to add your own configuration into the container:

```./workspace``` : Mounts on /root/workspace on the container and serves as to shared
any files from the host to the container.

```/.zshrc``` : A minimal zshrc file that can should be replaced to apply your own configurations.
Monts on /root/.zshrc

```.config/nvim``` : Uses my own dotfiles to be run on the container. Should be replaced with your own. Mounts
on /root/.config

# Building & Running

Run ```./run.sh``` to build and run the image.
