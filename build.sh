PATH_WORKING_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
export $(grep -v '^#' $PATH_WORKING_DIR/.env | xargs)

docker build -t $DOCKER_USERNAME/$(basename $PATH_WORKING_DIR)-auth  $PATH_WORKING_DIR/src/auth
docker build -t $DOCKER_USERNAME/$(basename $PATH_WORKING_DIR)-coolify-operator  $PATH_WORKING_DIR/src/coolify-operator
docker build -t $DOCKER_USERNAME/$(basename $PATH_WORKING_DIR)-web  $PATH_WORKING_DIR/src/web
docker build -t $DOCKER_USERNAME/$(basename $PATH_WORKING_DIR)-vibe-deployment-backend  $PATH_WORKING_DIR/src/vibe-deployment/backend
docker build -t $DOCKER_USERNAME/$(basename $PATH_WORKING_DIR)-vibe-deployment-frontend  $PATH_WORKING_DIR/src/vibe-deployment/frontend

if [ "$1" = "-u" ]; then
    docker push $DOCKER_USERNAME/$(basename $PATH_WORKING_DIR)-auth
    docker push $DOCKER_USERNAME/$(basename $PATH_WORKING_DIR)-coolify-operator
    docker push $DOCKER_USERNAME/$(basename $PATH_WORKING_DIR)-web
    docker push $DOCKER_USERNAME/$(basename $PATH_WORKING_DIR)-vibe-deployment-backend
    docker push $DOCKER_USERNAME/$(basename $PATH_WORKING_DIR)-vibe-deployment-frontend
fi
