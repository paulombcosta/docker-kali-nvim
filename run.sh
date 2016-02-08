cp ~/.vimrc .
docker build -t paulocosta/kali .
docker stop kali
docker rm kali
docker run -it --name=kali \
  -v $PWD/.config:/root/.config \
  -v $PWD/workspace:/root/workspace \
  -v $PWD/.zshrc:/root/.zshrc \
  paulocosta/kali
