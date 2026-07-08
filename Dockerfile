# Etapa 1: build de la SPA con Vite
FROM node:20-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

# Etapa 2: servir el build estático con nginx (imagen minimalista)
FROM nginx:1.27-alpine
# gettext incluye envsubst, usado para inyectar la URL pública de los backends en tiempo de arranque
RUN apk add --no-cache gettext
COPY --from=build /app/dist/ /usr/share/nginx/html
COPY env-config.template.js /usr/share/nginx/html/env-config.template.js
COPY docker-entrypoint.sh /docker-entrypoint.d/30-env-config.sh
RUN chmod +x /docker-entrypoint.d/30-env-config.sh
EXPOSE 80
