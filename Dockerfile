From node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#for only elastic beanstalk in aws and nothing for us in local computer 
EXPOSE 80  
COPY --from=builder /app/build /usr/share/nginx/html