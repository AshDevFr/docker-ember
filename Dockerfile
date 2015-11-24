FROM ashdev/docker-nodejs:v4.2.2
MAINTAINER AshDev <ashdevfr@gmail.com>

ENV workdir_path /home/workspace
WORKDIR ${workdir_path}

RUN npm install -g ember-cli
RUN npm install -g bower
RUN npm install -g phantomjs

RUN apt-get install -y python-dev automake

RUN \
  git clone https://github.com/facebook/watchman.git &&\
  cd watchman &&\
  git checkout v4.1.0  # the latest stable release &&\
  ./autogen.sh &&\
  ./configure &&\
  make &&\
  make install

RUN cd ${workdir_path}

EXPOSE 4200 49152

VOLUME ${workdir_path}

ENTRYPOINT ["/usr/local/bin/ember"]

CMD ["help"]
