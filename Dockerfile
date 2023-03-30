# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the package.json files for both server and client
COPY server/package*.json /app/server/
COPY client/package*.json /app/client/

# Install the dependencies for both server and client
RUN npm install --prefix server
RUN npm install --prefix client

# Copy the server and client source code
COPY server /app/server/
COPY client /app/client/

# Build the client
RUN npm run build --prefix client

# Expose the port used by the server
EXPOSE 8080

# Start the server
CMD ["npm", "start", "--prefix", "server"]
