# About

Passalong is an alternative UI for donorschoose.org. It's primary purpose, however, is to be a learning experience for myself so that I can increase my exposure to serverless computing.

There are three directories:

* `passalong-back` is a Django based REST API deployed in a Lambda via Zappa
* `passalong-front` is a React based front end hosted in S3
* `infra` is a GeoEngineer/Terraform setup for building out the ancillary AWS infrastructure for the project

# Usage

Install:

* GeoEngineer https://github.com/coinbase/geoengineer
* Python 3 and Pipenv
* Node
* Terraform

Configure `~/.aws/credentials`.

Setting up the infrastructure:

```
cd infra
geo apply
```

Deploying the frontend:

* `yarn build`
* `yarn run publish`

Deploying the backend:

```
zappa deploy dev
```

---
