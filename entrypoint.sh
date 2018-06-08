#!/bin/sh

( sleep 4; tail -f /var/log/squid/access.log /var/log/squid/cache.log ) &

exec squid -N -d1

