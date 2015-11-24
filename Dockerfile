FROM ashdev/docker-nodejs:v4.2.2
MAINTAINER AshDev <ashdevfr@gmail.com>

ENV workdir_path /home/workspace
WORKDIR ${workdir_path}

RUN npm install -g ember-cli bower phantomjs

EXPOSE 4200 35729

VOLUME ${workdir_path}

ENTRYPOINT ["/usr/local/bin/ember"]

CMD ["help"]
