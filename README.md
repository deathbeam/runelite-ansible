# runelite-ansible
Ansible scripts for setting up local/remote environment for running RuneLite API

Requirements:
* `python` - [Python installation guide](https://realpython.com/installing-python/)
* `docker` - [Docker installation guide](https://docs.docker.com/engine/installation/)
* `docker` python library - `pip install docker` for Python 3 or `pip install docker-py` for Python 2
* `ansible` - `pip install ansible`
* `yq` - `pip install yq` - optional, used only for `dump.sh`

Usage:

```bash
ansible-playbook playbook.yml
```

Usage with Vagrant:

```bash
vagrant up
```

To dump MySQL tables (needs to be done after http-service is deployed):

```bash
./dump.sh --no-data
```

After you have everything running, you need to set these JVM params for `http-service`:

```
-Drunelite.http-service.url=http://localhost:8080
-Drunelite.ws.url=http://localhost:8081
-Dspring.profiles.active=dev
```

and these for `runelite-client`:
```
-Drunelite.http-service.url=http://localhost:8080
-Drunelite.ws.url=http://localhost:8081
```

You can set the JVM params after you press *Run -> Edit Configurations...* like
this:

![edit-configurations](https://i.imgur.com/MjgQW2t.png)

