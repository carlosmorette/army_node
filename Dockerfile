FROM elixir:1.16-otp-26

WORKDIR /app

COPY lib lib
COPY mix.exs mix.lock ./

RUN mix do deps.get, deps.compile, compile
