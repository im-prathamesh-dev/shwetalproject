# -------------------------------
# Base Image
# -------------------------------
FROM node:18-alpine

# -------------------------------
# Set working directory
# -------------------------------
WORKDIR /app

# -------------------------------
# Copy package.json and package-lock.json
# -------------------------------
COPY package*.json ./

# -------------------------------
# Install dependencies
# -------------------------------
RUN npm install --production

# -------------------------------
# Copy all project files
# -------------------------------
COPY . .

# -------------------------------
# Expose port (your app likely runs on 3000 or 5000)
# Change if needed
# -------------------------------
EXPOSE 3000

# -------------------------------
# Start the app
# -------------------------------
CMD ["node", "app.js"]
