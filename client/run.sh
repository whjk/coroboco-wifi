#!/bin/sh

export CORO_SERVER="192.168.42.1"
# export CORO_SERVER="127.0.0.1"
export CORO_PORT="1337"

ruby app.rb
