FROM node:lts as builder

WORKDIR /app

COPY . /app

RUN yarn install

RUN yarn build

FROM nginx:stable-alpine as deploy

WORKDIR /app

RUN apk add yarn

COPY --from=builder /app/build /usr/share/nginx/html/

CMD ["yarn", "start"]
