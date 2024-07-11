#!/bin/bash
ERLANG_COOKIE="RANDOM-HASH"

node_name="${SERVICE_NAME}@${SERVICE_NAME}"
iex --cookie $ERLANG_COOKIE --sname $node_name -S mix