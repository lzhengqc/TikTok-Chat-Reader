# Use a Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Install Nginx and Supervisor
RUN apk add --no-cache nginx supervisor

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy application source code
COPY . .

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy Supervisord configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Create log directory for supervisor
RUN mkdir -p /var/log/supervisor

# Expose port 80 for Nginx
EXPOSE 80

# Start Supervisord
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
