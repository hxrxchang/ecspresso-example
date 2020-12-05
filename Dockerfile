FROM node:12

WORKDIR /usr/src/app

COPY app/package.json ./
COPY app/yarn.lock ./

RUN yarn install

COPY app/ .

RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]
