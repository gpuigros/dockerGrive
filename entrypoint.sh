#!/bin/bash

if [ "$SLEEP" = "true" ]; then
    while true; do sleep 10000; done
fi
cd /opt/grive
grive
