
build
----
docker build -t mod_jk .

run
---
docker run -i -t -p 8008:80 -d mod_jk
