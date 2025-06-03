FROM cloudron/base:5.0.0@sha256:04fd70dbd8ad6149c19de39e35718e024417c3e01dc9c6637eaf4a41ec4e596c

RUN mkdir -p /app/code
WORKDIR /app/code

ARG VERSION=18.6.1

RUN curl -L https://github.com/atuinsh/atuin/releases/download/v${VERSION}/atuin-x86_64-unknown-linux-gnu.tar.gz | tar xz --strip-components 1 -C /app/code

COPY start.sh /app/pkg/

CMD [ "/app/pkg/start.sh" ]

