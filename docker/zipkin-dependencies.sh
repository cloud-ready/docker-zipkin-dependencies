#!/bin/bash
set -e

export STORAGE_TYPE="${STORAGE_TYPE:-elasticsearch}"
export ES_HOSTS="${ES_HOSTS:-http://192.168.1.108:9202}"

LOG_PATH="/data/logs"

JAVA_OPTS="${JAVA_OPTS} -XX:+UseG1GC"

JAVA_OPTS="${JAVA_OPTS} -XX:+HeapDumpOnOutOfMemoryError -XX:-OmitStackTraceInFastThrow"

# http://stackoverflow.com/questions/137212/how-to-solve-performance-problem-with-java-securerandom
JAVA_OPTS="${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom"

# crash dump & heap dump
JAVA_OPTS="${JAVA_OPTS} -XX:ErrorFile=/tmp/jvm-crash-zipkin-dependencies.log -XX:HeapDumpPath=/tmp"

JAVA_OPTS="${JAVA_OPTS} -Xloggc:${LOG_PATH}/jvmgc.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCApplicationConcurrentTime -XX:+PrintGCApplicationStoppedTime"
JAVA_OPTS="${JAVA_OPTS} -Dfile.encoding=UTF-8"
export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS} ${JAVA_OPTS}"

exec java -jar /home/alpine/zipkin-dependencies.jar
