# Dockerfile for a Monolithic App

# Base image
FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy the rest of the app files
COPY . .

# Expose port
EXPOSE 3000

# Start app
CMD ["npm", "start"]
