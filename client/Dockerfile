FROM node:14.15.3-alpine3.12 AS builder

WORKDIR /app

COPY package.json ./

RUN npm install --production

COPY . . 

RUN npm run build


FROM nginx:1.19.6-alpine

EXPOSE 3000

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/build /usr/share/nginx/html
