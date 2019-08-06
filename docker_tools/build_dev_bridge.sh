#!/usr/bin/env bash

###############################################################################
# Copyright 2019 Ridecell. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

# Usage:
#   ./build_dev_bridge.sh ./dev_bridge.x86_64.dockerfile
DOCKERFILE=$1


CONTEXT="$(dirname "${BASH_SOURCE[0]}")"

REPO=apolloauto/apollo
ARCH=$(uname -m)
TIME=$(date +%Y%m%d_%H%M)
VERSION_X86_64="x86_64-20190617_1100"

TAG="${REPO}:dev-bridge-${VERSION_X86_64}"
# TAG="${REPO}:dev_bridge-latest"

# Fail on first error.
set -e
docker build -t ${TAG} -f ${DOCKERFILE} ${CONTEXT}
echo "Built new image ${TAG}"
