#!/bin/sh
set -e
echo "starting dockerd..."
set -- sudo dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=vfs &
exec java -jar /usr/share/jenkins/slave.jar \
	-jnlpUrl http://192.168.99.100:38080/computer/dind-node-1/slave-agent.jnlp \
	-secret bee075f8fd9033ec7d89d7bf08e106d6e2588d278efc99ad19c4fb931a29108c "$@"