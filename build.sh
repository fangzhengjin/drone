docker run --rm -e GO111MODULE=on -e GOPROXY=https://goproxy.cn -v $PWD:/workspace 172.17.27.51/docker.io/golang:1.14.15 sh -c "cd /workspace && GOARCH=amd64 GOOS=linux scripts/build.sh"
DOCKER_IMAGE=172.17.27.51/drone/drone:$(date '+%Y%m%d%H%M%S')
docker build -t $DOCKER_IMAGE -f docker/Dockerfile.server.linux.amd64 .
docker push $DOCKER_IMAGE
docker rmi $DOCKER_IMAGE