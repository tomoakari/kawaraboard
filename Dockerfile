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

COPY --from=build /kawaraboard/package*.json ./
COPY --from=build /kawaraboard/build ./build
COPY --from=build /kawaraboard/node_modules ./node_modules

EXPOSE 3000

CMD ["node", "build"]