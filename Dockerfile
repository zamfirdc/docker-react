#build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#run phase
FROM nginx
#expose is only for Elastic Beanstalk
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html