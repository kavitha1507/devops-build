# Use Node.js as the base image for building
FROM node:18 AS build

WORKDIR /app

COPY *.json ./
RUN npm install

COPY . .
RUN npm run build

# Use Nginx for serving the static files
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
