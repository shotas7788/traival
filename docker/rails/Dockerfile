FROM ruby:2.6.3
RUN apt-get update -qq && \
    apt-get install -y apt-utils \
                       build-essential \
                       libpq-dev \
                       nodejs \
                       default-mysql-client \
                    && apt-get clean \
                    && rm -rf /var/lib/apt/lists/*
ENV LANG ja_JP.UTF-8
RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install
COPY . .
EXPOSE 8080
CMD ["bundle", "exec", "unicorn", "-p", "8080", "-c", "/app/config/unicorn.rb"]       