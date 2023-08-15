# ==== CONFIGURE =====
# Use a Node 18.x base image
FROM node:18.2.0 AS base
WORKDIR /app


# Copy app files
COPY . .


# ==== RUN =======
# Set the env to "production"
ENV NODE_ENV production


RUN npm install

# ==== BUILD =====
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm ci --legacy-peer-deps

# Build the app
FROM base AS build
RUN npm run build-prod

FROM base
# Expose the port on which the app will be running 
EXPOSE 3000

RUN npm install -g serve

# Start the app
# serve -s dist -p 3001
CMD [ "serve", "-s", "dist" ]


