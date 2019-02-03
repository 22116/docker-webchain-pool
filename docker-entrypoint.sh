#!/usr/bin/env bash

make
cd www && ./build.sh && cd ..
./build/bin/webchain-pool config.json
