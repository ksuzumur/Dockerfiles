configure
---
Replace your port and host IP

    worker.node1.port=8009
    worker.node1.host=192.168.122.1


build
---
docker build -t mod_jk .

run
---
docker run -i -t -p 8008:80 -d mod_jk
