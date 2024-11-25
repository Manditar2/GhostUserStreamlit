FROM node:slim

WORKDIR /app

# Instala las dependencias necesarias para Chromium
RUN apt-get update && apt-get install -y \
  chromium \
  libatk-bridge2.0-0 \
  libgtk-3-0 \
  libx11-xcb1 \
  libxcomposite1 \
  libxrandr2 \
  libxdamage1 \
  libgbm1 \
  libasound2 \
  libpangocairo-1.0-0 \
  libcups2 \
  libnss3 \
  libxshmfence1 \
  libxfixes3 \
  --no-install-recommends && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# Establece la variable de entorno para Puppeteer
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Copia los archivos del proyecto
COPY package*.json ./
RUN npm install
COPY . .

# Comando para ejecutar el script
CMD ["node", "test.js"]
