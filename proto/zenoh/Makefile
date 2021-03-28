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
	curl 'http://localhost:8000/@/router/local/**/backend/*'
	curl 'http://localhost:8000/@/router/local/**/storage/*'

git-update gu:
	cd ../..; make gu


