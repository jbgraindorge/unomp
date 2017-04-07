FROM node:0.10

#get needed packages
RUN apt-get update && apt-get install -y build-essential libssl-dev && rm -rf /var/lib/apt/lists/*

#nvm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash \
&& export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
nvm install stable\
nvm use stable

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/UNOMP/unified-node-open-mining-portal.git unomp
WORKDIR /usr/src/app/unomp
RUN npm update

EXPOSE 80 3008 3032 3256
CMD [ "node", "init.js" ]
