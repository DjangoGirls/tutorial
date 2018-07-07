FROM node:9-alpine as build
WORKDIR /book
RUN npm install -g gitbook-cli
COPY book.json .
RUN gitbook install
COPY . .
RUN gitbook build

FROM nginx:alpine
COPY --from=build /book/_book /usr/share/nginx/html
