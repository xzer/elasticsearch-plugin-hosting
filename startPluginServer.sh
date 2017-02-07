#!/bin/bash

port=$1

if [ X"" = X"$port" ];
then
    port=9100
fi

python -m SimpleHTTPServer $port