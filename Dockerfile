FROM node:20 AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

FROM node:20-slim

RUN apt-get update && apt-get install -y apache2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app .
COPY ./index.html /var/www/html/

EXPOSE 80 3000

CMD ["npm", "start"]
