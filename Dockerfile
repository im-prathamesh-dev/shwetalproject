# -------------------------------
# Base Image
# -------------------------------
FROM node:18-alpine

# -------------------------------
# Create non-root user
# -------------------------------
RUN addgroup -S nodegroup && adduser -S nodeuser -G nodegroup

# -------------------------------
# Set working directory
# -------------------------------
WORKDIR /app

# -------------------------------
# Copy package files & install dependencies
# -------------------------------
COPY package*.json ./
RUN npm install --production

# -------------------------------
# Copy the rest of the project
# -------------------------------
COPY . .

# -------------------------------
# Change ownership to non-root user
# -------------------------------
RUN chown -R nodeuser:nodegroup /app

# -------------------------------
# Switch to non-root user
# -------------------------------
USER nodeuser

# -------------------------------
# Expose app port
# -------------------------------
EXPOSE 3000

# -------------------------------
# Start the app
# -------------------------------
CMD ["node", "app.js"]
