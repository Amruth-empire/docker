#Base image
FROM node:20-alpine3.18

#Set the working directory
WORKDIR /app

#copy package.json and package-lock.json
COPY package.json .
COPY package-lock.json .

#install dependencies
RUN npm install --omit=dev

#copy the rest of the application
COPY . .

EXPOSE 8000 3000 30001

#start the application  
CMD ["npm","start"]
