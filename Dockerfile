FROM cirepo/java-oracle:8u171-en_US.UTF-8_Asia.Shanghai-alpine

ARG ARTIFACT_REPOSITORY=unknown
ARG BUILD_TIMESTAMP=unknown
ARG DOCKER_REGISTRY=unknown
ARG GIT_BRANCH=unknown
ARG GIT_COMMIT_ID=unknown
ARG GIT_COMMIT_ID_ABBREV=unknown
ARG GIT_COMMIT_TIME=unknown
ARG GIT_REMOTE_ORIGIN_URL=unknown
ARG JAR_FILE
ARG PROJECT_ARTIFACTID=unknown
ARG PROJECT_GROUPID=unknown
ARG PROJECT_VERSION=unknown

LABEL image.artifact.repository=$ARTIFACT_REPOSITORY
LABEL image.build.timestamp=$BUILD_TIMESTAMP
LABEL image.docker.registry=$DOCKER_REGISTRY
LABEL image.git.branch=$GIT_BRANCH
LABEL image.git.commit.id=$GIT_COMMIT_ID
LABEL image.git.commit.id.abbrev=$GIT_COMMIT_ID_ABBREV
LABEL image.git.commit.time=$GIT_COMMIT_TIME
LABEL image.git.remote.origin.url=$GIT_REMOTE_ORIGIN_URL
LABEL image.project.artifactId=$PROJECT_ARTIFACTID
LABEL image.project.groupId=$PROJECT_GROUPID
LABEL image.project.version=$PROJECT_VERSION

VOLUME /data

RUN wget -O zipkin-dependencies.jar 'https://search.maven.org/remote_content?g=io.zipkin.dependencies&a=zipkin-dependencies&v=LATEST'
RUN sudo apk add busybox-suid

COPY docker /

ENTRYPOINT ["/entrypoint.sh"]