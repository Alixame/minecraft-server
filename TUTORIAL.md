# Tutorial: como entrar no servidor Ignatioon MC

Servidor: **`52.70.162.32`**
Versão: **Minecraft Java 1.21.1 + NeoForge** (modpack de tecnologia: Create, AE2, Mekanism, Powah…)

Leva uns 10 minutos. Você só faz isso uma vez.

---

## O que você precisa

- **Minecraft Java Edition** original (a versão Bedrock, de celular, console ou Windows Store, não funciona)
- O arquivo **`ignatioon-mc-client.zip`**, que o admin manda
- **Java**: o launcher oficial do Minecraft já instala sozinho

---

## 1. Rodar o 1.21.1 puro uma vez

1. Abra o **Minecraft Launcher**.
2. Vá em **Instalações → Nova instalação**, escolha a versão **1.21.1** e salve.
3. Clique em **Jogar**, espere o menu principal abrir e feche o jogo.

> Assim o launcher baixa os arquivos da 1.21.1 de que o NeoForge precisa.

---

## 2. Instalar o NeoForge

1. Acesse **https://neoforged.net/** e clique no link de download da versão **21.1.x** (é a versão do NeoForge para o Minecraft 1.21.1). Vai baixar um arquivo `neoforge-21.1.xxx-installer.jar`.
2. Abra esse `.jar` com dois cliques. Se não abrir, rode `java -jar neoforge-21.1.xxx-installer.jar` no terminal.
3. Deixe marcado **Install client** e clique em **OK**.

No launcher vai aparecer uma instalação chamada **NeoForge** (`neoforge-21.1.xxx`).

---

## 3. Colocar os mods

1. Abra a pasta do Minecraft:
   - **Windows:** aperte `Win + R`, digite `%appdata%\.minecraft` e dê Enter
   - **Mac:** no Finder, aperte `Cmd + Shift + G` e cole `~/Library/Application Support/minecraft`
   - **Linux:** `~/.minecraft`
2. Se já existir uma pasta **`mods`**, **mova o que tem dentro dela para outro lugar**. Mods que não fazem parte do pack impedem a entrada no servidor.
3. Extraia o **`ignatioon-mc-client.zip`** **dentro dessa pasta do Minecraft**. Ele já cria a pasta `mods` com os 39 arquivos `.jar`.

Para conferir, o caminho tem que ficar assim:

```
.minecraft/
└── mods/
    ├── create-....jar
    ├── appliedenergistics2-....jar
    ├── Mekanism-....jar
    └── ... (39 arquivos .jar)
```

> ⚠️ Os arquivos `.jar` precisam estar **direto** dentro de `mods/`. Se ficar `mods/mods/...`, o jogo não reconhece.

---

## 4. Dar mais memória para o jogo (recomendado)

Este pack é pesado: com o padrão de 2GB o jogo trava ou fecha.

1. No launcher, vá em **Instalações** e passe o mouse sobre **NeoForge** → **⋯ → Editar**.
2. Clique em **Mais opções**.
3. Em **Argumentos JVM**, troque o `-Xmx2G` do começo por **`-Xmx6G`**. Se o seu PC tiver só 8GB de RAM, use `-Xmx4G` (menos que isso não roda bem).
4. Salve.

---

## 5. Entrar no servidor

1. No launcher, selecione **NeoForge** e clique em **Jogar**.
   - A primeira abertura demora bastante (alguns minutos é normal).
   - No menu principal aparece um botão **Mods**, que mostra a lista dos mods carregados.
2. Vá em **Multijogador → Adicionar servidor**:
   - **Nome:** Ignatioon MC
   - **Endereço:** `52.70.162.32`
3. Clique em **Pronto** e entre no servidor.

---

## Problemas comuns

| Problema | Solução |
|---|---|
| "Mod mismatch" / "Incompatible mods" / desconecta ao entrar | Os seus mods estão diferentes dos do servidor. Apague tudo de `mods/` e extraia o zip **mais recente** de novo. |
| Não aparece **NeoForge** no launcher | Rode o instalador do NeoForge de novo (versão **21.1.x**) com **Install client** marcado. |
| O jogo fecha ao abrir | Confira se não sobrou mod antigo em `mods/` e se você está usando o perfil do NeoForge, e não o 1.21.1 puro. Também veja se deu memória suficiente (passo 4). |
| Travando / pouco FPS | Aumente a memória (passo 4). Em **Opções → Vídeo**, baixe a distância de renderização para 8–10. |
| "Connection timed out" | O servidor pode estar desligado. Fale com o admin. |
| Quero shaders | O Iris já está incluído. Baixe um shader (ex.: *Complementary Reimagined*), coloque em `.minecraft/shaderpacks/` e ative em **Opções → Vídeo → Shader Packs**. |

---

## Atalhos úteis dos mods

| Tecla | O que faz |
|---|---|
| `M` | Mapa-múndi (Xaero's World Map) |
| `B` | Criar waypoint no minimapa |
| `E` | Abrir o inventário. Com o EMI, as receitas aparecem do lado; passe o mouse em um item e aperte `R` (receita) ou `U` (usos) |
| `B` (com mochila equipada) | Abrir a Traveler's Backpack. Se der conflito com o waypoint, troque a tecla em **Opções → Controles** |

## Por onde começar na parte de tecnologia

- **Create:** engrenagens e máquinas mecânicas. Comece fazendo **Andesite Alloy** e uma roda d'água. Segure `W` olhando um bloco do Create para ver a explicação (Ponder).
- **Mekanism:** máquinas elétricas e processamento de minério (até 5× minério). Comece pelo **Metallurgic Infuser**.
- **Powah:** geração de energia. Comece pelo **Energizing Orb**.
- **Applied Energistics 2:** armazenamento digital e autocrafting. Ache um **meteorito** para conseguir os presses.
- **Create Crafts & Additions:** liga o Create à energia elétrica (FE).
- Use o **EMI** (receitas ao lado do inventário) o tempo todo.

Pronto, bom jogo! ⛏️
