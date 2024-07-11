#!/bin/bash
erlang_cookie="RANDOM-HASH"
node_name="${SERVICE_NAME}@${SERVICE_NAME}"
iex --cookie $erlang_cookie --sname $node_name -S mix