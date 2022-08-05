FROM node:lts as builder

WORKDIR /app

COPY . /app

RUN yarn install

RUN yarn build

FROM nginx:stable-alpine as deploy

RUN apk add yarn

WORKDIR /app

COPY ./package.json /package.json

COPY --from=builder /app/build /usr/share/nginx/html/

CMD ["yarn", "start"]
