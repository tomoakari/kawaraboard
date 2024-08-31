# ビルドステージ
FROM node:18 as build

WORKDIR /app

# my-app-name ディレクトリの内容をコピー
COPY kawaraboard ./

# COPY package*.json ./
COPY /package.json ./
COPY /package-lock.json ./

RUN npm install

RUN npm run build

# 実行ステージ
FROM node:18-slim

WORKDIR /app

COPY --from=build /app/build ./build
COPY --from=build /app/package.json .
COPY --from=build /app/node_modules ./node_modules

EXPOSE 3000

CMD ["node", "build"]