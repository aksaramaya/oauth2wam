FROM aksaramaya/oauth2wam

# set environment
ENV APP=/opt/gagak
ENV NODE_PATH=/usr/lib/node_modules

RUN apk add --update nodejs
# Create app directory
RUN mkdir -p $APP
WORKDIR $APP

# Install app dependencies
COPY package.json $APP
RUN npm install

# Bundle app source
COPY . $APP

RUN apk del make gcc libc-dev g++

EXPOSE 3000
CMD [ "npm", "start" ]
