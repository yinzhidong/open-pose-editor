# ==== CONFIGURE =====
# Use a Node 18.x base image
FROM node:18.2.0
WORKDIR /app


# Copy app files
COPY . .


# ==== RUN =======
# Set the env to "production"
ENV NODE_ENV production


# ==== BUILD =====
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm ci --legacy-peer-deps

# Build the app
RUN npm run build-pro

# Expose the port on which the app will be running 
EXPOSE 3000

RUN npm install -g serve

# Start the app
# serve -s dist -p 3001
CMD [ "serve", "-s", "dist" ]


