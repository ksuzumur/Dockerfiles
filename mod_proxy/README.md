configure
---
Replace your port and host IP

    eg)
    http://192.168.122.1:8080


build
---
docker build -t mod_proxy .

run
---
docker run -i -t -p 8008:80 -d mod_proxy
