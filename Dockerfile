FROM ruby:3.1.3
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install
COPY . ./

CMD ['ruby', 'bin/bot.rb']
