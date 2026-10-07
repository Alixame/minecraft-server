# minecraft-server

Servidor Minecraft Java **1.21.1 + Fabric** na AWS (EC2 t4g.medium, us-east-1, conta `artisaan`), rodando em Docker com [`itzg/minecraft-server`](https://github.com/itzg/docker-minecraft-server).

- **Endereço:** `52.70.162.32:25565` (Elastic IP)
- **Modpack:** vanilla+ (lista em `mods.txt`; só-cliente em `client-mods.txt`)
- **Cliente:** Fabric 1.21.1 + zip gerado por `./scripts/build-client.py` (`dist/ignatioon-mc-client.zip`)

## Scripts

| Script | O que faz |
|---|---|
| `scripts/provision.sh` | Cria SG, EC2 e Elastic IP do zero |
| `scripts/user-data.sh` | Bootstrap da EC2 (swap + Docker) |
| `scripts/run.sh` | (Re)cria o container `mc` |
| `scripts/deploy.sh` | Envia `mods.txt` + `run.sh` pra EC2 e reinicia |

## Administração

```bash
ssh -i ~/Desenvolvimento/Ignatioon/artisaan-access.pem ubuntu@52.70.162.32
sudo docker logs -f mc          # logs
sudo docker exec -it mc rcon-cli # console
```

Mundo, configs e mods ficam em `/opt/minecraft/data` na EC2. ## Mods

1. Edite `mods.txt` (slug do Modrinth, um por linha; fixe versão com `slug:versao`).
2. Rode `./scripts/deploy.sh` (servidor) e `./scripts/build-client.py` (zip pros jogadores).

Mods removidos da lista são apagados do servidor (`REMOVE_OLD_MODS`). Mods que também precisam estar no cliente: avise a galera.

Se o SSH der timeout, seu IP mudou — atualize a regra da porta 22 no `minecraft-sg`.
