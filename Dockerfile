
#### Пункт 2: Створення Dockerfile

```Dockerfile
FROM ruby:3.1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["rspec"]
