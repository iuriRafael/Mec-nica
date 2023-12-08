FROM ruby:latest

WORKDIR /app

COPY Gemfile Gemfile.lock ./

COPY . .

RUN bundle install

EXPOSE 4567

CMD ["ruby", "app.rb"]