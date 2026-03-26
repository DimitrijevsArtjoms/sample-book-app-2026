FROM node:25-slim
LABEL AUTHOR="Autors"

WORKDIR /sample-book-app
COPY index.js index.js
COPY package.json package.json

RUN npm install

EXPOSE 1050

CMD ["index.js"]
ENTRYPOINT ["node"]
