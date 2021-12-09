from ubuntu:16.04
ENV HOME /home/root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN apt-get update \
    && apt-get upgrade \
    && apt-get install build-essential -y \
    && apt-get install git -y \
    && apt-get install wget -y \
    && git clone --depth 1 https://github.com/pyenv/pyenv.git ~/.pyenv \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc \
    && echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
    && echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc \
    && pyenv install 3.9.6 \
    && pyenv global 3.9.6 \
    && pip3 install --upgrade pip \
    && pip3 install 'buildbot[bundle]'
