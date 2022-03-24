FROM alpine

LABEL maintainer="Junmin Ahn <junminahn@outlook.com>"

RUN apk add --update nodejs &&\
    apk add --update npm

COPY entrypoint.js entrypoint.js

RUN addgroup -S node && adduser -S node -G node
USER node

ENTRYPOINT ["node", "./entrypoint.js"]
