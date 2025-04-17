FROM ruby:3.3-slim

# Install system packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Set the working directory
WORKDIR /app

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Add the rest of the app
COPY . .

# Precompile assets (if you're using them)
RUN bundle exec rake assets:precompile

# Run the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
