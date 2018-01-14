name = rkn-bypasser
args =

install: build start

build:
	docker build -t $(name) .

start:
	docker run -d --restart=unless-stopped -p 127.0.1.1:8000:8000 -e TOR --name $(name) $(name) $(args)

stop:
	docker rm -f $(name)

rebuild: stop build start

restart: stop start

log:
	docker logs -f $(name)