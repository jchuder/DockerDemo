# Image執行環境 use alpine
FROM node:16.3.0-alpine

# 設定當前的工作目錄
WORKDIR /usr/src/app

# 複製本機檔案到Image的/usr/src/app內，本機根目錄為Dockerfile檔案的目錄
# 以下為複製package.json & app.js兩個檔案
COPY package*.json app.js ./

# 執行Linux指令
# alpine內要用apk update(不可用apt update)
RUN apk update && npm i && npm install && cat app.js

# port
EXPOSE 3000

# 執行docker run時會執行的指令(逗號當空格)
CMD ["node", "app.js"]