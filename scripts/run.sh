#!/bin/bash
# (Re)cria o container do servidor. Rodar na EC2: sudo /opt/minecraft/run.sh
set -e
docker rm -f mc 2>/dev/null || true
docker run -d --name mc --restart unless-stopped -p 25565:25565 \
  -v /opt/minecraft/data:/data \
  -v /opt/minecraft/mods.txt:/extras/mods.txt:ro \
  -e EULA=TRUE -e TYPE=NEOFORGE -e VERSION=1.21.1 -e MEMORY=6G \
  -e MODRINTH_PROJECTS=@/extras/mods.txt \
  -e MODRINTH_DOWNLOAD_DEPENDENCIES=required -e REMOVE_OLD_MODS=TRUE \
  -e MOTD="Ignatioon MC" -e MAX_PLAYERS=10 -e ONLINE_MODE=FALSE \
  -e VIEW_DISTANCE=8 -e SIMULATION_DISTANCE=6 \
  itzg/minecraft-server:java21
