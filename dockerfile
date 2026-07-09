FROM node:lts-alpine

WORKDIR /xenia-web-service

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

ENV API_PORT=36000
# MongoDB on host system or container (27018)# #more vibecode :)#
ENV MONGO_URI=mongodb://mongo:27017/xenia
ENV SWAGGER_API=true
ENV nginx=true

EXPOSE 36001
EXPOSE 36000

CMD [ "npm", "start" ]
