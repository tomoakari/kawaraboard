# ビルドステージ
FROM node:18 as build

WORKDIR /kawaraboard

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# 実行ステージ
FROM node:18-slim

WORKDIR /kawaraboard

COPY --from=build /app/package*.json ./
COPY --from=build /app/build ./build
COPY --from=build /app/node_modules ./node_modules

EXPOSE 3000

CMD ["node", "build"]