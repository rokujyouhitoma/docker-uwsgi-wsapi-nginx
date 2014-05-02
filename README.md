```bash
$ docker build -t wsapi-server .
#$ docker run -d wsapi-server
#$ docker run -i -t wsapi-server:latest /bin/bash

$ docker run -p 49160:80 -d wsapi-server

$ boot2docker ssh
password: tcuser

docker@boot2docker:~$ curl localhost:49160
<h1>Hello Wsapi!</h1>
```
