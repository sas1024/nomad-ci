# Nomad CI image

This image will be useful for deploying Nomad jobs to Gitlab CI or any other.

## Gitlab CI Example

```
nomad-deploy:
  cache: {}
  variables:
    GIT_STRATEGY: none
  image: sas1024/nomad-ci
  stage: deploy
  script:
    - CI_NOMAD_JOB=deployments/job.nomad
    - export NOMAD_ADDR=$NOMAD_NODE
    - nomad validate $CI_NOMAD_JOB
    - nomad plan $CI_NOMAD_JOB || if [ $? -eq 255 ]; then exit 255; else echo "success"; fi
    - nomad run $CI_NOMAD_JOB

```
