#!/bin/bash

set -e

cd ~/install/mpb
make check

cd ~/install/meep
make check
