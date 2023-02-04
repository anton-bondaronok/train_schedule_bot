FROM ruby:3.2.0
WORKDIR /bot
COPY . /bot
RUN bundle install
CMD ["ruby", "entrypoint.rb"]
