curl jws-3.0.zip
docker build -t jws3.0 .
docker run -i -t -p 8080:80 -d jws3.0
