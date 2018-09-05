FROM ruby:2.5-alpine

RUN mkdir -p /opt/app-root/app

WORKDIR /opt/app-root/app

COPY .bundle/config $BUNDLE_APP_CONFIG
COPY . .

RUN bundle install --local

ENTRYPOINT /opt/app-root/app/exe/fib
