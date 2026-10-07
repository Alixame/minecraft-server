#!/usr/bin/env python3
"""Gera dist/ignatioon-mc-client.zip com os mods (NeoForge 1.21.1) + dependências."""
import json, pathlib, urllib.parse, urllib.request, zipfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
MC, LOADER = "1.21.1", "neoforge"
API = "https://api.modrinth.com/v2"

def get(url):
    req = urllib.request.Request(url, headers={"User-Agent": "Alixame/minecraft-server"})
    return urllib.request.urlopen(req).read()

def read_list(name):
    lines = (ROOT / name).read_text().splitlines()
    return [l.split("#")[0].strip() for l in lines if l.split("#")[0].strip()]

def version_for(project, pinned=None):
    q = "?loaders=" + urllib.parse.quote(json.dumps([LOADER])) + "&game_versions=" + urllib.parse.quote(json.dumps([MC]))
    versions = json.loads(get(f"{API}/project/{project}/version{q}"))
    if pinned:
        versions = [v for v in versions if v["version_number"] == pinned]
    releases = [v for v in versions if v["version_type"] == "release"]
    if not (releases or versions):
        raise SystemExit(f"Sem versão {LOADER} {MC} para {project}")
    return (releases or versions)[0]

seen, files, queue = set(), {}, [e.split(":", 1) + [None] for e in read_list("mods.txt") + read_list("client-mods.txt")]
while queue:
    project, pinned = queue.pop(0)[:2]
    v = version_for(project, pinned)
    if v["project_id"] in seen:
        continue
    seen.add(v["project_id"])
    f = next(x for x in v["files"] if x["primary"]) if any(x["primary"] for x in v["files"]) else v["files"][0]
    files[f["filename"]] = f["url"]
    print(f"  {project:32} {v['version_number']}")
    queue += [[d["project_id"], None] for d in v["dependencies"] if d["dependency_type"] == "required" and d.get("project_id")]

out = ROOT / "dist" / "ignatioon-mc-client.zip"
out.parent.mkdir(exist_ok=True)
with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as z:
    for name, url in sorted(files.items()):
        z.writestr(f"mods/{name}", get(url))
print(f"\n{len(files)} mods -> {out.relative_to(ROOT)}")
