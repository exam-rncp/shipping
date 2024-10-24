#!/usr/bin/env bash

IMAGE=shipping

set -ev

export BUILD_VERSION="0.0.2-SNAPSHOT"
export BUILD_DATE=`date +%Y-%m-%dT%T%z`

SCRIPT_DIR=$(dirname "$0")
DOCKER_CMD=docker

if [[ -z "$GROUP" ]] ; then
    echo "Cannot find GROUP env var"
    exit 1
fi

if [[ -z "$TAG" ]] ; then
    echo "Cannot find TAG env var"
    exit 1
fi

CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR
$DOCKER_CMD run --rm -v $HOME/.m2:/root/.m2 -v $CODE_DIR:/usr/src/mymaven -w /usr/src/mymaven maven:3.5.2-jdk-8 mvn -DskipTests package

cp $CODE_DIR/target/*.jar $CODE_DIR/docker/${IMAGE}


REPO=${GROUP}/${IMAGE}
$DOCKER_CMD build \
    --build-arg BUILD_VERSION=$BUILD_VERSION \
    --build-arg BUILD_DATE=$BUILD_DATE \
    --build-arg COMMIT=$TAG \
    -t ${REPO}:${TAG} $CODE_DIR/docker/${IMAGE};
