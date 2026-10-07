#!/bin/bash
# Envia mods.txt e run.sh pra EC2 e recria o container
set -e
ROOT=$(cd "$(dirname "$0")/.." && pwd)
HOST=${HOST:-ubuntu@52.70.162.32}
KEY=${KEY:-$HOME/Desenvolvimento/Ignatioon/artisaan-access.pem}
scp -i "$KEY" "$ROOT/mods.txt" "$ROOT/scripts/run.sh" "$HOST:/tmp/"
ssh -i "$KEY" "$HOST" 'sudo mv /tmp/mods.txt /tmp/run.sh /opt/minecraft/ && sudo chmod +x /opt/minecraft/run.sh && sudo /opt/minecraft/run.sh >/dev/null &&
  for i in $(seq 1 60); do sudo docker logs mc 2>&1 | grep -qE "Done \(|Crash report" && break; sleep 5; done;
  sudo docker logs mc 2>&1 | grep -E "Done \(|Crash report" | tail -3; ls /opt/minecraft/data/mods'
