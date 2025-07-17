# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./


# Install all dependencies (including devDependencies)
RUN npm install

# Ensure binaries are executable (fixes Windows to Linux permission issues)
RUN chmod +x node_modules/.bin/* || true

# Copy the rest of the application code
COPY . .

# Build the app (for Vite projects)
RUN npm run build

# Expose the port Vite serves on
EXPOSE 5173

# Start the app using Vite preview
CMD ["npm", "run", "preview"]
