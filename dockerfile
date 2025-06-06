
FROM node:18-alpine AS build


WORKDIR /app


COPY package*.json ./


RUN npm install


COPY . .


RUN npm run build

FROM node:18-alpine AS serve


WORKDIR /app


COPY --from=build /app/dist /app/dist


RUN npm install -g serve


EXPOSE 80


CMD ["serve", "-s", "dist", "-l", "80"]
