#!/bin/bash
set -euo pipefail

DIR=$(cd "$(dirname "$0")/.." && pwd)
PATH="$DIR/bin:$PATH"

CLUSTER=$1

echo "[+] Creating cluster $CLUSTER..."
eksctl-anywhere create cluster \
  -f "$DIR/clusters/$CLUSTER.yaml" \
  --hardware-skip-power-on \
  --install-ovfs-from "$DIR/ova"

