FROM node:18

WORKDIR /app

COPY . .

RUN chown -R node:node /app 
EXPOSE 3000
USER node

CMD ["node","app.js"]

