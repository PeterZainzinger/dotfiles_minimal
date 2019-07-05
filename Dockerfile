FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
      git \
      zsh \
      neovim \
      tmux \
      curl \
      xclip \
      man  \
      locales 

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY init.vim .
RUN mkdir -p ~/.config/nvim &&  \
    mv init.vim ~/.config/nvim && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
     vim +PlugInstall +slient +:qall
COPY .tmux.conf .
RUN mv .tmux.conf ~
# install oh my zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
COPY .zshrc /root/.zshrc
COPY .zshalias /root/.zshalias
WORKDIR /root
ENTRYPOINT ["tmux"]

