# Use official Ruby image
FROM ruby:3.3

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  imagemagick \
  libvips \
  curl

# Set working directory
WORKDIR /app

# Install bundler and gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.5.23
RUN bundle install

# Copy the rest of the app
COPY . .

# Skip assets:precompile since you’re not using JS pipeline
# CMD to start the Rails server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
