# Use nginx image from Docker Hub as the base image
FROM nginx:alpine

RUN mkdir -p /etc/nginx/ssl

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose both port 80 and 443
EXPOSE 80 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
