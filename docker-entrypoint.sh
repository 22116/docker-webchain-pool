#!/usr/bin/env bash

cd www && ./build.sh && cd ..
./build/bin/webchain-pool config.json
