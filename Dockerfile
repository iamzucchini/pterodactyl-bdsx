FROM alpine
COPY ./entrypoint.sh /root/entrypoint.sh

RUN apk update
RUN apk add freetype git nodejs npm wine gnutls ncurses-libs xvfb
RUN Xvfb :0 &
RUN export DISPLAY=:0

WORKDIR /home/container
RUN git init
RUN git config pull.ff only
RUN git remote add upstream https://github.com/bdsx/bdsx.git

ENTRYPOINT /root/entrypoint.sh
