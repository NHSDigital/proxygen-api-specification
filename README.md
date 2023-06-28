# Proxygen API Specification

TODO: Pipeline status badges

This is a RESTful API Specification for the Proxygen service in [OAS v3.0](https://swagger.io/specification/v3/) format. It is published on the [API Catalogue](https://digital.nhs.uk/developer/api-catalogue).

Proxygen is an internal-use NHS England service for API Producer teams building and running services on the API Management platform.

The Proxygen implementation is found in the [api-management-infrastructure](https://github.com/NHSDigital/api-management-infrastructure) repo.

- `specification/` This [Open API Specification](https://swagger.io/docs/specification/about/) describes the endpoints, methods and messages exchanged by the API. Use it to generate interactive documentation; the contract between the API and its consumers.
- `scripts/` Utilities helpful to developers of this specification.
- `.github/` GitHub Actions workflows automating the Software Development Lifecycle of this repository.

## Contributing

Contributions to this project are welcome from anyone, providing that they conform to the [guidelines for contribution](https://github.com/NHSDigital/proxygen-api-specification/blob/main/CONTRIBUTING.md) and the [community code of conduct](https://github.com/NHSDigital/proxygen-api-specification/blob/main/CODE_OF_CONDUCT.md).

## Licensing

This code is dual licensed under the MIT license and the OGL (Open Government License). Any new work added to this repository must conform to the conditions of these licenses. In particular this means that this project may not depend on GPL-licensed or AGPL-licensed libraries, as these would violate the terms of those libraries' licenses.

The contents of this repository are protected by Crown Copyright (C).

## Software Development Lifecycle: Editing, Previewing and Publishing

### Automation

The SDLC is driven by a number of GitHub Actions workflows defined in `.github/workflows/`:

- `pr-lint.yml` [PR Quality Check](https://github.com/NHSDigital/proxygen-api-specification/actions/workflows/release.yml)
**When a PR is opened** the branch name is checked for conformity to agreed format. Helpful information is added to the PR.
- `lint-specification.yml` Lint Specification
**When pushing to a branch with an open PR** runs a linter on the specification to check it is a valid OAS v3.0 specification.
- `publish-to-uat.yml` [Publish Spec to Bloomreach UAT Portal](https://github.com/NHSDigital/proxygen-api-specification/actions/workflows/publish-uat.yml)
**Run manually** to publish a specification from any branch to the Bloomreach UAT Portal for previewing.
- `release.yml` [Create Release and Publish to Live API Catalogue](https://github.com/NHSDigital/proxygen-api-specification/actions/workflows/release.yml)
**On merging to `main`** this publishes the updated specification to the live API Catalogue

### Workflow

1. Create a branch. The name must include

## OAS Authoring

## Key Dependencies

This repo is for an OAS specification file. As such there are no dependencies ******per se****** however the following utilities are used by the GitHub actions workflows:

- [openapi-spec-validator](https://github.com/python-openapi/openapi-spec-validator)
For checking the OAS specification conforms to valid OAS v3.0 specification.
- [proxygen-cli](https://github.com/NHSDigital/proxygen-cli)
For managing the deployment of the specification.

These are installed and managed by `poetry`✨
