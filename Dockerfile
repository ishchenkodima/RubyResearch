
#### Пункт 2: Створення Dockerfile

1. Створіть файл `Dockerfile` в корені вашого репозиторію.
2. Скопіюйте та вставте наступний вміст:

```Dockerfile
FROM ruby:3.1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["rspec"]
