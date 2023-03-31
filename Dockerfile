FROM node:16-alpine AS app-build

WORKDIR /app/frontend

RUN npm i -g pnpm

COPY ./frontend/package.json ./package.json

COPY ./frontend/pnpm-lock.yaml ./pnpm-lock.yaml

COPY ./frontend/src ./src

COPY ./frontend/public ./public

RUN pnpm install

RUN pnpm build



FROM node:16-alpine AS api-build

WORKDIR /app/backend

RUN npm i -g pnpm

COPY ./backend/package.json ./package.json

COPY ./backend/pnpm-lock.yaml ./pnpm-lock.yaml

COPY ./backend/src ./src

COPY ./backend/uploads ./uploads

COPY --from=app-build /app/frontend/build ./frontend/build

RUN pnpm install

ENV NODE_ENV=production

EXPOSE 5000

CMD [ "pnpm", "start" ]
