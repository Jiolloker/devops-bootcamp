
# docker compose jenkins stack
docker-compose -f jenkins.yaml up -d

# docker compose sonarquebe stack

docker-compose -f sonarqube.yaml up -d

# configuration steps:

* install docker pipeline plugin on docker.
* install sonarquebe scaner plugin on jenkins.
* create a user for jenkins.
* generate a token for jenkins user.