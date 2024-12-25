FROM docker.n8n.io/n8nio/n8n

USER root

ENV VIRTUAL_ENV=/app/venv

ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

RUN apk update && apk add --no-cache python3-dev python3 py3-pip gcc build-base bash

ENV SHELL=/bin/bash

COPY requirements.txt requirements.txt

RUN python3 -m venv ${VIRTUAL_ENV}

RUN chown -R node:node ${VIRTUAL_ENV}

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia configuraciones o scripts adicionales si es necesario
# COPY ./scripts /usr/local/bin/scripts

# Opcional: instala dependencias adicionales para n8n
# Ejemplo: n8n-cli o plugins personalizados
# RUN npm install -g <paquete_npm>

#USER node

ENTRYPOINT ["/docker-entrypoint.sh"]