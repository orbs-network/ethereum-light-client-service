# FROM parity/parity:v2.7.2-stable

FROM ethereum/client-go:v1.9.12

# clear source image entrypoint
ENTRYPOINT []

# set up healtcheck

# USER root

# RUN apt-get update && apt-get install -y sudo ca-certificates
# RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
# RUN apt-get install -y nodejs git-core

RUN apk add --no-cache nodejs npm git

RUN npm i -g https://github.com/orbs-network/ethereum-healthcheck.git

HEALTHCHECK --interval=1m --timeout=30s --start-period=5s --retries=5 CMD [ "node", "ethereum-healthcheck", "http://localhost:8545", "/opt/orbs/status/status.json" ]

VOLUME [ "/opt/orbs/logs", "/opt/orbs/status", "/opt/orbs/cache" ]

ADD ./service /opt/orbs/

USER parity

CMD /opt/orbs/service