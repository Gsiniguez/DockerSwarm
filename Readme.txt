Para empezar debera ingresar este comando en el docker Manager1 (Principal)
docker swarm init --advertise-addr=eth1 --data-path-addr=eth1


ArangoDB:
Implementacion usando bash y docker:
export INSTANCE_GROUP="group1"
export INSTANCE_NAME="arango1"
export INSTANCE_PORT=8529
export INSTANCE_PASSWORD="do-not-use-this-password-in-production"

export ARANGO_IMAGE_TAG="3.4.0"
export ARANGO_IMAGE_REPO="arangodb/arangodb"
export ARANGO_IMAGE="${ARANGO_IMAGE_REPO}:${ARANGO_IMAGE_TAG}"
export ARANGO_VOLUME="arangodb-${INSTANCE_NAME}--3.4.0"
export ARANGO_APPS_VOLUME="arangodb-apps-${INSTANCE_NAME}--3.4.0"
export ARANGO_PUBLISHED_PORT=$INSTANCE_PORT
export ARANGO_STORAGE_ENGINE="rocksdb"
export ARANGO_ROOT_PASSWORD=$INSTANCE_PASSWORD
export LIMITS_CPU=1
export LIMITS_MEMORY=1024M

docker stack deploy -c ./docker-stack-arango.yml $INSTANCE_NAME