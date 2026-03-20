#build stage
FROM node:lts as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

#run stage
FROM node:18
WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3000

CMD ["npm", "run", "start"]