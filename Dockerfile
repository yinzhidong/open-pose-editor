# ==== CONFIGURE =====
# Use a Node 18.x base image
FROM nginx:stable-alpine AS base

COPY dist /usr/share/nginx/html
