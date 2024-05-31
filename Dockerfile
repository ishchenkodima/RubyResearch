# Вказати базовий образ
FROM ruby:2.7

# Встановити залежності
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Встановити робочий каталог
WORKDIR /myapp

# Скопіювати Gemfile та Gemfile.lock у робочий каталог
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Встановити геми
RUN bundle install

# Скопіювати решту коду додатку
COPY . /myapp

# Вказати команду, яку слід виконати при запуску контейнера
CMD ["rails", "server", "-b", "0.0.0.0"]
