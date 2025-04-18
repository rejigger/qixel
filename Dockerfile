# Use official Ruby image
FROM ruby:3.3

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  imagemagick \
  libvips \
  curl

# Set working directory
WORKDIR /app

# Install bundler
COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.5.23
RUN bundle install

# Copy rest of the app
COPY . .

# Precompile assets (optional: remove if not needed yet)
RUN bundle exec rake assets:precompile

# Start the Rails server by default
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
