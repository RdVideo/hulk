FROM node:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js packages
RUN npm i net http2 tls cluster url crypto fs axios cheerio gradient-string node-telegram-bot-api shell-quote child_process eris

# Copy your index.js file into the Docker image
COPY index.js /app/

# Set the working directory
WORKDIR /app

# Command to run the application
CMD ["node", "index.js"]
