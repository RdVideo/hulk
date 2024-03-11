# Use the official ubuntu image
FROM ubuntu:latest

# Install nodejs and npm
RUN apt-get update && apt-get install -y nodejs npm

# Install required npm packages
RUN npm i net http2 tls cluster url crypto fs axios cheerio gradient-string node-telegram-bot-api shell-quote child_process eris

# Copy the index.js file into the container (assuming it's in the same directory as the Dockerfile)
COPY index.js /app/index.js

# Set the working directory
WORKDIR /app

# Run the index.js file
CMD ["node", "index.js"]
