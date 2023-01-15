FROM node:lts-alpine

ARG WORKDIR

ENV HOME=/usr/local/todo

WORKDIR ${HOME}

COPY package.json .

RUN apk update && npm install -g npm

# CMD ["npm", "run", "vue"]