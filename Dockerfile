FROM elixir:1.16-otp-26

WORKDIR /app

COPY config config
COPY lib lib
COPY mix.exs mix.lock ./
COPY docker_entrypoint.sh .

RUN mix do deps.get, deps.compile, compile

ENTRYPOINT ["./docker_entrypoint.sh"]