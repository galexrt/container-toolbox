#!/usr/bin/env sh

pip3 install prometheus_client || { echo "Failed to pip3 install prometheus_client"; exit 1; }
