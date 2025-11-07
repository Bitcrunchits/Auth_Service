

FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .
# USER node  # <-- Ejecuta la app con permisos limitados (¡Mejora de seguridad!)
EXPOSE 3000
CMD ["node", "app.js"]