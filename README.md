# runelite-ansible
Ansible scripts for setting up local/remote environment for running RuneLite API

Requirements:
* `python` - [Python installation guide](https://realpython.com/installing-python/)
* `docker` - [Docker installation guide](https://docs.docker.com/engine/installation/)
* `docker` python library - `pip install docker`
* `ansible` - `pip install ansible`
* `yq` - `pip install yq` - optional, used only for `dump.sh`

Usage:

```bash
ansible-playbook playbook.yml
```

To deploy [http-service](https://github.com/runelite/runelite/tree/master/http-service)

```bash
mvn -pl http-service tomcat7:redeploy -nsu -Drunelite.tomcat.url="http://localhost/manager/text/"
```

To build [http-api](https://github.com/runelite/runelite/tree/master/http-api) pointing to localhost:

```bash
mvn -Drunelite.api.url=http://localhost -Drunelite.api.ws=ws://localhost install
```

To dump MySQL tables (needs to be done after http-service is deployed):

```bash
./dump.sh --no-data
```
