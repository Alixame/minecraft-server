# minecraft-server

Servidor Minecraft Java **1.21.1 + Fabric** na AWS (EC2 t4g.medium, us-east-1, conta `artisaan`), rodando em Docker com [`itzg/minecraft-server`](https://github.com/itzg/docker-minecraft-server).

- **Endereço:** `52.70.162.32:25565` (Elastic IP)
- **Mods (servidor):** Fabric API, Lithium, FerriteCore, Krypton
- **Cliente:** Fabric 1.21.1 + Fabric API

## Scripts

| Script | O que faz |
|---|---|
| `scripts/provision.sh` | Cria SG, EC2 e Elastic IP do zero |
| `scripts/user-data.sh` | Bootstrap da EC2 (swap + Docker) |
| `scripts/run.sh` | (Re)cria o container `mc` |

## Administração

```bash
ssh -i ~/Desenvolvimento/Ignatioon/artisaan-access.pem ubuntu@52.70.162.32
sudo docker logs -f mc          # logs
sudo docker exec -it mc rcon-cli # console
```

Mundo, configs e mods ficam em `/opt/minecraft/data` na EC2. Para adicionar mods, inclua o slug do Modrinth em `MODRINTH_PROJECTS` no `run.sh` e rode-o de novo.
