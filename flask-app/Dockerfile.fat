# Start from an empty Alpine image
FROM alpine:3.10
# Set the working directory in the container to /app
WORKDIR /app
# Install necessary tools and packages
RUN apk add --no-cache \
    python2 \
    py2-pip \
    nodejs \
    npm \
    build-base
# Copy the requirements.txt first to leverage Docker caching
COPY requirements.txt /app/requirements.txt
# Install any Python packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# If your project has frontend components requiring npm
# Copy the package.json and package-lock.json for npm packages
COPY package*.json ./
# Install npm packages
RUN npm install
RUN npm build
#RUN npm run start
# Copy the rest of the application into the container
COPY . /app
# Expose port 5000 for the Flask app
EXPOSE 5000
# Set the Entrypoint to execute the application
ENTRYPOINT [ "python", "app.py" ]