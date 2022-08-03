FROM node:latest

WORKDIR /app

COPY package*.json ./

RUN yarn install

COPY . .

#CMD ["yarn", "run", "serve"]

CMD ["yarn", "start"]