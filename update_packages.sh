#!/usr/bin/env bash
yay -Qe | awk '{print $1}' > packages.yay
