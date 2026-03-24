#build stage
FROM node:lts as builder
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN corepack enable && corepack prepare pnpm@latest --activate
RUN pnpm install --frozen-lockfile
COPY . .
RUN pnpm build

#run stage
FROM node:18
WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3000

CMD ["npm", "run", "start"]