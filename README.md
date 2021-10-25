[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <img alt="delineate.io" src="https://github.com/delineateio/.github/blob/master/assets/logo.png?raw=true" height="75" />
  <h2 align="center">delineate.io</h2>
  <p align="center">portray or describe (something) precisely.</p>

  <h3 align="center">Packer Examples</h3>

  <p align="center">
    This project has some examples of using Packer.
    <br />
    <a href="https://github.com/delineateio/packer-examples"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/delineateio/packer-examples/issues">Report Bug</a>
    ·
    <a href="https://github.com/delineateio/packer-examples/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Examples</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

This mini project  examples using [Hashicorp Packer](https://www.packer.io/) to create various images.  Specifically it provides examples of [Docker](https://www.docker.com/), [GCP](https://cloud.google.com/gcp) and [Digital Ocean](https://www.digitalocean.com/) image builds.  There are two Packer configurations provides in this project for Docker and Cloud VMs respectively.

### Built With

* [Hashicorp Packer](https://www.packer.io/)
* [Docker](https://www.docker.com/)
* [GCP](https://cloud.google.com/gcp)
* [Digital Ocean](https://www.digitalocean.com/)

<!-- GETTING STARTED -->
## Getting Started

### Local Setup

To get started follow the instructions below

```shell
# clone the repo
git clone https://github.com/delineateio/packer-examples.git

# installs the tooling requirements
pip install -r requirements.txt

# installs the git hook for pre-commit
pre-commit install
```

### GCP Authentication

* A GCP project is required with...
  * [Compute Admin API](https://cloud.google.com/compute/docs/reference/rest/v1) enabled as described [here](https://cloud.google.com/endpoints/docs/openapi/enable-api)
  * VPC Firewall allowing SSH traffic to VMs with tag `packer` as described [here](https://cloud.google.com/vpc/docs/using-firewalls)
* Authenticated to `gcloud` or one of the other approaches documented [here](https://www.packer.io/docs/builders/googlecompute#running-on-google-cloud)

### Digital Ocean Account & API Token

To run the Cloud VM image example a Digital Ocean account is required.  An API Token should be created as described [here](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and added a file `.env` in the project root...

```shell
# exports the DO token
export DIGITALOCEAN_API_TOKEN=[TOKEN]
```

<!-- USAGE EXAMPLES -->
## Examples

### Docker Images Example

The [Docker](https://www.docker.com/) example creates two images for [Ubuntu](https://ubuntu.com/) and [Alpine](https://alpinelinux.org/) respectively.

```shell
# ensures packer plugins are installed and up to date
packer init -upgrade ./docker

# build the docker images
packer build -force ./docker
```

### Cloud Images Example

The cloud image example creates two Ubuntu images, in [GCP](https://cloud.google.com/gcp) and [Digital Ocean](https://www.digitalocean.com/) respectively.

```shell
# set the local env variables
source .env

# ensures packer plugins are installed and up to date
packer init -upgrade ./cloud

# build the cloud images
packer build -force -var gcp_project_id=[PROJECT] ./cloud
```

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/delineateio/packer-examples/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

If you would like to contribute to any Capco Digital OSS projects please read:

* [Code of Conduct](https://github.com/delineateio/.github/blob/master/CODE_OF_CONDUCT.md)
* [Contributing Guidelines](https://github.com/delineateio/.github/blob/master/CONTRIBUTING.md)

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [Best README Template](https://github.com/othneildrew/Best-README-Template/blob/master/README.md)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/delineateio/packer-examples.svg?style=for-the-badge
[contributors-url]: https://github.com/delineateio/packer-examples/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/delineateio/packer-examples.svg?style=for-the-badge
[forks-url]: https://github.com/delineateio/packer-examples/network/members
[stars-shield]: https://img.shields.io/github/stars/delineateio/packer-examples.svg?style=for-the-badge
[stars-url]: https://github.com/delineateio/packer-examples/stargazers
[issues-shield]: https://img.shields.io/github/issues/delineateio/packer-examples.svg?style=for-the-badge
[issues-url]: https://github.com/delineateio/packer-examples/issues
[license-shield]: https://img.shields.io/github/license/delineateio/packer-examples.svg?style=for-the-badge
[license-url]: https://github.com/delineateio/packer-examples/blob/main/LICENSE
