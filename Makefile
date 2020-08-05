hello-world:
	docker run hello-world

docker-build:
	docker build .

docker-build-tag:
	docker build -t my-first-container .

docker-run-my-first-container:
	docker run my-first-container

docker-run-nginx:
	# https://hub.docker.com/_/nginx
	docker run -p 8080:80 nginx

docker-run-nginx-demon:
	docker run -d -p 8080:80 nginx
	# check logs docker logs container id

docker-add-custom-name:
	docker run --name nginx-container -d -p 8080:80 nginx

docker-exec-bash:
	# mostly used to debug stuff inside the container
	docker exec -it nginx-container bash

docker-static-webpage-nginx-build:
	docker build -t nginx-container-static -f Dockerfile.nginx .

docker-static-webpage-nginx-run: docker-static-webpage-nginx-build
	docker run --rm --name nginx-static-webpage -p 8080:80 nginx-container-static

docker-static-webpage-nginx-run-mount: docker-static-webpage-nginx-build
	docker run --rm --name nginx-static-webpage -v /home/erik/Workspace/playground/docker-samples-demo/static-html-directory:/www/data/ -p 8080:80 nginx-container-static

docker-compose-up:
	docker-compose up

docker-compose-down:
	docker-compose down --remove-orphans

# Add second container -> dns resolution
