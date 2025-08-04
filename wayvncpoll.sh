#!/usr/bin/env bash

sleep 2
coproc wayvncctl -j event-receive
grep -m1 client-disconnected <&${COPROC[0]}
[[ $COPROC_PID ]] && kill $COPROC_PID
wayvncctl wayvnc-exit
