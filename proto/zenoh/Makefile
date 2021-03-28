#
# Makefile for Zenoh
#
NAME=zenoh
IMAGE=eclipse/$(NAME):latest

usage:
	@echo "usage: make (docker) for $(NAME)"

docker-run dr:
	docker run -d --name=$(NAME) --init -p 7447:7447/tcp -p 7447:7447/udp -p 8000:8000/tcp $(IMAGE)

docker-kill dk:
	docker stop $(NAME) && docker rm $(NAME)

docker-ps dp:
	docker ps -a

docker-test dt:
	curl http://localhost:8000/@/router/local

dt2:
	curl 'http://localhost:8000/@/router/local/**/backend/*'
	curl 'http://localhost:8000/@/router/local/**/storage/*
	'
dt3:
	curl -X PUT -H 'content-type:application/properties' -d 'path_expr=/demo/example/**' \
		http://localhost:8000/@/router/local/plugin/storages/backend/memory/storage/my-storage

dt4:
	curl -X PUT -d 'Hello World!' http://localhost:8000/demo/example/test

dt5:
	curl http://localhost:8000/demo/example/test

dt6:
	curl -X DELETE http://localhost:8000/demo/example/test


git-update gu:
	cd ../..; make gu


