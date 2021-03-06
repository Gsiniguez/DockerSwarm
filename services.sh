
# Service Traefik
docker service create \
    --name traefik \
    --constraint=node.role==manager \
    --publish 80:80 --publish 8080:8080 \
    --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
    --network traefik-net \
    traefik:latest \
    --docker \
    --docker.swarmMode \
    --docker.domain=traefik \
    --docker.watch \
    --api


docker-machine ssh manager1 "docker service create \
    --name traefik \
    --constraint=node.role==manager \
    --publish 80:80 --publish 8080:8080 \
    --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
    --network traefik-net \
    traefik \
    --docker \
    --docker.swarmMode \
    --docker.domain=traefik \
    --docker.watch \
    --api"