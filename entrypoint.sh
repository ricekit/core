#!/bin/sh

cp -r rice-in/. rice-out/
chown -R $(stat -c %U:%G rice-out) rice-out