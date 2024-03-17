# Proximaplan
Projekt für den IFT Unterricht an der GHSE

## Funktion
Proximaplan ist eine Projektmanagement-Website mit simplem Design.
Das Ziel derWebsite ist Projektmanagement so einfach wie möglich zu machen.

# Quick-Start Guide

## Docker
Wenn du noch kein Docker installiert hast folge diesem Guide:

Windows:
https://docs.docker.com/desktop/wsl/

Linux:
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

## Windows

### WSL installieren

Öffne Powershell und führe aus:
```shell
wsl --install -d Ubuntu
```

Starte deinen PC neu nach der Installation.

Starte Ubuntu unter dem Windows Start Menu und folge den Anweisungen

Folge Der Linux installation ab hier.

## Linux (Ubuntu)

### Rails Setup
Klone dieses Repo:
```shell
git clone https://github.com/benzooku/ift_project.git
cd ift_project
```
Starte die Docker mit docker-compose
```shell
docker-compose up -d
```
Fertig!

### Server stoppen
```shell
docker-compose down
```

# Developement

Öffne den Ordner in VS Code (VS Code braucht diese Extension: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
Drücke rechts unten auf Reopen in Container.

Falls der server nicht in Dev-Mode läuft, drücke links unten auf "Dev Container: Rails" und dann auf Rebuild Container
