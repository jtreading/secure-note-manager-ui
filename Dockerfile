FROM node:latest AS ui-builder
WORKDIR /app/ui
COPY ./package*.json ./
COPY . .

RUN npm install

FROM node:latest
WORKDIR /app
COPY --from=ui-builder /app/ui /app/ui
COPY ./start.sh .

RUN chmod +x ./start.sh

EXPOSE 3000

CMD ["./start.sh"]