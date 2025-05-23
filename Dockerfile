# Use the official nginx image from Docker Hub
FROM nginx:latest

# Copy the public directory to the nginx html directory
COPY public/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
