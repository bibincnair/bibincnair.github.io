# Use the official Ruby image with the latest version based on Alpine Linux
FROM ruby:3.3-alpine

# Install essential build tools and tzdata for timezone information
# build-base is for compiling native extensions for gems
RUN apk add --no-cache build-base tzdata

# Set the working directory inside the container
WORKDIR /srv/jekyll

# Copy the Gemfile and Gemfile.lock to leverage Docker cache
COPY Gemfile Gemfile.lock ./

# Install gem dependencies using Bundler
# The --jobs 4 flag can speed up the installation
RUN bundle install --jobs 4

# Copy the rest of your Jekyll site source code into the container
COPY . .

# Expose port 4000 so the Jekyll server can be accessed from your local machine
EXPOSE 4000

# Configure the default command to run when the container starts
# This will serve the Jekyll site and watch for changes with live reloading
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload"]