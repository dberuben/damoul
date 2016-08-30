#!/usr/bin/env bash
cd /root
wget http://localhost:8080/jnlpJars/jenkins-cli.jar

echo "building deck"
java -jar jenkins-cli.jar -s http://localhost:8080/ build spinnaker-deck --username jenkins --password jenkins -s &

echo "building front50"
java -jar jenkins-cli.jar -s http://localhost:8080/ build spinnaker-front50 --username jenkins --password jenkins -s &

echo "building rosco"
java -jar jenkins-cli.jar -s http://localhost:8080/ build spinnaker-rosco --username jenkins --password jenkins -s &

echo "building clouddriver"
java -jar jenkins-cli.jar -s http://localhost:8080/ build spinnaker-clouddriver --username jenkins --password jenkins -s &

echo "building orca"
java -jar jenkins-cli.jar -s http://localhost:8080/ build spinnaker-orca --username jenkins --password jenkins -s &

echo "building gate"
java -jar jenkins-cli.jar -s http://localhost:8080/ build spinnaker-gate --username jenkins --password jenkins -s &

echo "building igor"
java -jar jenkins-cli.jar -s http://localhost:8080/ build spinnaker-igor --username jenkins --password jenkins -s 
