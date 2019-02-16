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
