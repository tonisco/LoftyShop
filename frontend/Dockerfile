FROM node:16-alpine

WORKDIR /app

RUN npm i -g pnpm

COPY ./package.json ./package.json

COPY ./pnpm-lock.yaml ./pnpm-lock.yaml

COPY ./src ./src

COPY ./public ./public

RUN pnpm install

EXPOSE 3000

CMD [ "pnpm", "start" ]