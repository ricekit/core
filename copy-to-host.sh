#!/bin/sh

if [  -d /app/rice-out ]; then
    cp -r /app/riceuser/. /app/rice-out/
    chown -R $(stat -c %U:%G /app/rice-out) /app/rice-out
else
    echo "Directory /app/rice-out does not exist. Skipping copy."
fi
