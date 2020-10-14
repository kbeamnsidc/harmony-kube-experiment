FROM node

RUN apt-get update && \
    apt-get -y install libgdal-dev libpq-dev libsqlite3-dev

WORKDIR /opt/harmony

COPY package*.json ./

RUN npm install gdal-next --build-from-source --shared_gdal
RUN npm install

COPY ./app ./app
COPY .env ./
COPY tsconfig* ./
COPY config ./config
COPY db ./db
COPY example ./example
COPY public ./public

EXPOSE 3000
CMD [ "npm", "run", "start-dev" ]
