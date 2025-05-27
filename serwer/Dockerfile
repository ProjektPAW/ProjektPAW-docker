
#docker for server
FROM node:slim
RUN apt update && apt install -y git
WORKDIR /app
RUN git clone --single-branch https://github.com/projektpaw/projektpaw repo
WORKDIR repo
COPY .env ./
RUN npm install
EXPOSE 5000
CMD ["node","server.js"]