# Digital staff passport API specification

[![Create Release and Publish to Live API Catalogue](https://github.com/NHSDigital/digital-staff-passport/actions/workflows/release.yml/badge.svg)](https://github.com/NHSDigital/digital-staff-passport/actions/workflows/release.yml)


This is a RESTful API Specification for the FIXME in [OAS v3.0](https://swagger.io/specification/v3/) format. It is published on the [API Catalogue](https://digital.nhs.uk/developer/api-catalogue).

FIXME - WHAT IS THIS

- `specification/` This [Open API Specification](https://swagger.io/docs/specification/about/) describes the endpoints, methods and messages exchanged by the API. Use it to generate interactive documentation; the contract between the API and its consumers.
- `scripts/` Utilities helpful to developers of this specification.
- `.github/` GitHub Actions workflows automating the Software Development Lifecycle of this repository.

## Contributing

Contributions to this project are welcome from anyone, providing that they conform to the [guidelines for contribution](https://github.com/NHSDigital/digital-staff-passport/blob/main/CONTRIBUTING.md) and the [community code of conduct](https://github.com/NHSDigital/digital-staff-passport/blob/main/CODE_OF_CONDUCT.md).

## Licensing

This code is dual licensed under the MIT license and the OGL (Open Government License). Any new work added to this repository must conform to the conditions of these licenses. In particular this means that this project may not depend on GPL-licensed or AGPL-licensed libraries, as these would violate the terms of those libraries' licenses.

The contents of this repository are protected by Crown Copyright (C).

## Software Development Lifecycle: Editing, Previewing and Publishing

### Automation

The SDLC is driven by a number of GitHub Actions workflows defined in `.github/workflows/`:

- `pr-lint.yml` [PR Quality Check](https://github.com/NHSDigital/digital-staff-passport/actions/workflows/release.yml)
**When a PR is opened:** branch name is checked for conformity to agreed format; helpful information is added to the PR; OAS spec is linted.
- `publish-to-uat.yml` [Publish Spec to Bloomreach UAT Portal](https://github.com/NHSDigital/digital-staff-passport/actions/workflows/publish-uat.yml)
**Run manually** to publish a specification from any branch to the UAT Portal for previewing.
- `release.yml` [Create Release and Publish to Live API Catalogue](https://github.com/NHSDigital/digital-staff-passport/actions/workflows/release.yml)
**On merging to `main`** a new release is created and the specification is updated on the API Catalogue.

### Workflow

1. Create a branch. The name must include a JIRA ticket reference.
2. Make changes to the specification (see [OAS Authoring](#oas-authoring), below)
3. Open a Pull Request for a colleague to review.
4. On successful review, and successful completion of the [PR Quality Check](https://github.com/NHSDigital/digital-staff-passport/actions/workflows/release.yml) pipeline, merge to `main`
5. Specification is published to the API Catalogue

### Previewing on the UAT Environment

Manually run the [Publish Spec to Bloomreach UAT Portal](https://github.com/NHSDigital/digital-staff-passport/actions/workflows/publish-uat.yml) against any branch to publish a preview to the UAT Portal. Only one preview can be published at a time.

## OAS Authoring

The specification is a collection of YAML files and can be modified with any text editor. However a number of tools are available to make the process easier.

The [openapi.tools](http://openapi.tools) website lists a number of [GUI Editors](https://openapi.tools/#gui-editors). Or you can find a plugin for your favourite text editor. Some suggestions below.

### VS Code Plugins

- [openapi-lint](https://marketplace.visualstudio.com/items?itemName=mermade.openapi-lint)
- [OpenAPI (Swagger) Editor](https://marketplace.visualstudio.com/items?itemName=42Crunch.vscode-openapi)
- [ReDocly OpenAPI](https://marketplace.visualstudio.com/items?itemName=Redocly.openapi-vs-code)

### Emacs Plugins

- [openapi-yaml-mode](https://github.com/esc-emacs/openapi-yaml-mode) provides syntax highlighting, completion, and path help

## OAS File Versioning

OAS Specifications have a mandatory `info.version` property indicating the version of the specification. In the repository it is set to `__VERSION__` and is populated during deployment.

On merge to `main` a release is created and the version is calculated from commits using the `scripts/calculate_version.py` script.

When publishing a preview using the [Publish Spec to Bloomreach UAT Portal](https://github.com/NHSDigital/digital-staff-passport/actions/workflows/publish-uat.yml) Workflow the `info.version` is set to `<branch_name>-<commit_SHA>`

## Key Dependencies

This repo is for an OAS specification file. As such there are no dependencies ******per se****** however the following utilities are used by the GitHub actions workflows:

- [vacuum](https://quobix.com/vacuum/)
An OpenAPI linter
- [proxygen-cli](https://github.com/NHSDigital/proxygen-cli)
Deploys the specification

### Secrets Required by Github Worflows
The Github workflows use the Proxygen CLI to perform automated deployment and therefore require some secrets to be defined. The current values for these are always stored in the APIM Prod AWS Secrets Manager.

| Workflow Variable | AWS SM Path |
| ----------- | ----------- |
| PROXYGEN_CLIENT_ID | prod/digital-staff-passport/client_id |
| PROXYGEN_KID | prod/digital-staff-passport/key_id |
| ENCODED_PROXYGEN_PRIVATE_KEY | prod/digital-staff-passport/keycloak_client_private_key |
