FROM node:18-alpine

WORKDIR /app

RUN npm i -g pnpm

COPY ./package.json ./package.json

COPY ./pnpm-lock.yaml ./pnpm-lock.yaml

COPY ./src ./src

COPY ./uploads ./uploads

RUN pnpm install

EXPOSE 5000

CMD [ "pnpm", "start" ]