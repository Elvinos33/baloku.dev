FROM node:lts-alpine as build
WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

FROM httpd:2.4 AS runtime
COPY --from=build /app/dist /usr/local/apache2/htdocs/
EXPOSE 80
