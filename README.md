# node-docker-compose
Image with node and docker-compose

Used to deploy node application with docker-compose

### Usage example

```yml
cache:
  paths:
    - node_modules/

stages:
  - deploy

deploy:
  image: dflourusso/node-docker-compose
  stage: deploy
  before_script:
    - mkdir $DOCKER_CERT_PATH
    - echo "$CA" > $DOCKER_CERT_PATH/ca.pem
    - echo "$CLIENT_CERT" > $DOCKER_CERT_PATH/cert.pem
    - echo "$CLIENT_KEY" > $DOCKER_CERT_PATH/key.pem
    - yarn
  script:
    - docker-compose build
    - docker-compose down
    - docker-compose up -d --force-recreate
  only:
    - master
  variables:
    DOCKER_MACHINE_NAME: "machine-name"
    DOCKER_TLS_VERIFY: "1"
    DOCKER_HOST: "tcp://<machine-ip>:2376"
    DOCKER_CERT_PATH: "certs"
```
