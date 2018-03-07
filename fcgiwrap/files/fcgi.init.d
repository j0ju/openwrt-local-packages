#!/bin/sh /etc/rc.common
# Copyright (C) 2018 Joerg Jungermann

START=96
USE_PROCD=1
DEFAULT_SOCKET_DIR=/var/run
BIN=/usr/bin/spawn-fcgi

start_fcgi_instance() {
  local name="$1"
  config_get program $name program
  config_get socket  $name socket ''
  config_get user    $name user nobody
  config_get group   $name group nogroup

  [ -z "$socket" ] && \
  socket="$DEFAULT_SOCKET_DIR/${name}.socket"

  echo "I: $name: socket=$socket program=$program $user:$group"

  procd_open_instance $name
  procd_set_param command $BIN -n -s "$socket"
  [ ! "$user" = root ] && [ ! "$user" = 0 ] && \
    procd_append_param command -u "$user"
  [ ! "$group" = root ] && [ ! "$group" = 0 ] && \
    procd_append_param command -g "$group"
  procd_append_param command --
  procd_append_param command "$program"
  procd_set_param respawn
  procd_close_instance
}

start_service() {
  config_load fcgi
  config_foreach start_fcgi_instance app
}

