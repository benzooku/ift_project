# Proximaplan
Projekt für den IFT Unterricht an der GHSE

## Funktion
Proximaplan ist eine Projektmanagement-Website mit simplem Design.
Das Ziel derWebsite ist Projektmanagement so einfach wie möglich zu machen.

# Quick-Start Guide

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

### Ruby installieren

Führe in der Shell aus:
```shell
sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
```
Installiere GPG keys für Ruby Version Manager (RVM):
```shell
gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```
Installiere RVM:
```shell
\curl -sSL https://get.rvm.io | bash -s stable
```
Installiere Ruby 3.2.2:
```shell
rvm install 3.2.2
rvm --default 3.2.2
```
### Rails installieren:
Führe in Shell aus:
```shell
gem install rails -v 7.1.2
```
### PostgreSQL installieren:
```shell
sudo apt install postgresql libpq-dev
sudo service postgresql start
```
PostgreSQL muss bei jedem Systemstart manuell gestartet werden.

```shell
sudo -u postgres createuser rails_server -s
#Suche dir ein Passwort aus.
sudo -u postgres psql
postgres=# \password *Passwort*
```
Um die Postgres Konsole zu verslassen:
```shell
postgres=# exit
```
Jetzt musst du das Passwort als Systemvariable speichern:
```shell
export DATABASE_PASSWORD=*Dein Passwort*
```
### Rails Setup
Klone dieses Repo:
```shell
git clone https://github.com/benzooku/ift_project.git
cd ift_project
```
Installiere die benötigten Pakete:
```shell
bundle install
```
Initialisiere die Database:
```shell
rails db:create
rails db:migrate
```
Fertig!

Um den Server zu starten:
```shell
rails server
```
