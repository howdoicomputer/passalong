# About

Passalong is an alternative UI for donorschoose.org. It's primary purpose, however, is to be a learning experience for myself so that I can increase my exposure to serverless computing.

There are three top-level directories, each with a different purpose:

* `passalong-back` is a Django based REST API deployed in a Lambda via Zappa
* `passalong-front` is a React based front end hosted in S3
* `infra` is a GeoEngineer/Terraform setup for building out the ancillary AWS infrastructure for the project

# Usage

Install:

* Ruby
* Python 3 and Pipenv
* Node
* Terraform

Run `bundle` from top-level directory in order to download GeoEngineer and Rake.

Configure `~/.aws/credentials`.

## Setting up the infrastructure:

* Check to see if the plan is to your liking with `rake infra:plan`
* Deploy your infrastructure with `rake infra:deploy`

## Deploying the frontend:

* `rake frontend:deploy`

## Deploying the backend:

* `rake backend:deploy`

---
