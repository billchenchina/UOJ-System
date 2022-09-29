#!/usr/bin/env bash

set -Eeuo pipefail
mkdir -p /opt/uoj/judger/log/
mkdir -p /opt/uoj/judger/uoj_judger/data/
exec $@
