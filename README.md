# anki-sync-server

[Anki](https://apps.ankiweb.net/) is a program which makes remembering things easy. Because it is a lot more efficient than traditional study methods, you can either greatly decrease your time spent studying, or greatly increase the amount you learn.

Anki's main form is a desktop application (for Windows, Linux and macOS) which can sync to a web version (AnkiWeb) and mobile versions for Android and iOS.

This is a personal Anki server, which you can sync against instead of AnkiWeb.

## Deploying on Sealos

[![](https://raw.githubusercontent.com/labring-actions/templates/main/Deploy-on-Sealos.svg)](https://cloud.sealos.io/?openapp=system-template%3FtemplateName%3Danki-sync-server)

## Deploying with Docker

```bash
$ docker run \
    --publish 80:8080 \
    --volume ./data:/syncserver \
    ghcr.io/yangchuansheng/anki-sync-server:latest
```

## Environment Variables

|Name|Default Value|
|:-|:-|
|SYNC_USER1|user:pass|
|SYNC_BASE|/syncserver|
|SYNC_PORT|8080|
|MAX_SYNC_PAYLOAD_MEGS|100|
|TZ|Asia/Shanghai|

