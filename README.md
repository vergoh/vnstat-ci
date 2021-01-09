# vnStat CI Setup

This repository contains the files used to setup the CI environment for [vnStat](https://humdi.net/vnstat/) testing. The setup is intended for running `make check` and other tooling easily for multiple distributions resulting in multiple compiler and library version combinations getting tested.

Triggers to content changes in the [actual repository](https://github.com/vergoh/vnstat) have been intentionally left out. Some content may also unintentionally be missing.

## Requirements

- Docker
- Jenkins with Docker connectivity
  - Using latest LTS release is suggested
- Following Jenkins plugins:
  - Pipeline
  - Docker
  - Docker Pipeline
  - Git
  - File System SCM
  - HTML Publisher
  - Job DSL
  - Warnings Next Generation
  - Cppcheck
  - Copy Artifact
  - Environment Injector
  - Sectioned View
  - Timestamper
- Optional "nice to have" plugins:
  - Job Configuration History
  - Rebuilder

Note that not all of the required plugins are visible in the initial startup Jenkins setup wizard.

## Getting started

1. Setup Jenkins
2. Edit `CI_DIR` in `jobs/Update_Setup/Jenkinsfile` to match the checkout directory of this repository
3. Create new Pipeline job named *Update_Setup*
   - Select Pipeline script from SCM and File System for SCM
   - Set path to checkout directory + `jobs/Update_Setup`
   - Keep script path as default (`Jenkinsfile`)
   - Save
4. Build *Update_Setup*
   - This will create rest of the necessary jobs and the *vnStat* view
   - In case of `ERROR: script not yet approved for use`, approve the script and start the job again
5. Build *Build_Containers*
   - This will build the Docker containers for several distributions using needed tooling
   - Expect this to take some time
   - This same job can be used to also update the existing containers
6. Build *Stage_from_GitHub*
7. Build *Start_Containertests*

## Usage

1. Build *Stage_from_GitHub*
2. Build *Start_Containertests*

Build *Build_Containers* when necessary to update existing containers.

## Project structure

- The `containers` directory contains the Dockerfiles used for all tested distributions
  - The `build.sh` script in the directory can be used to build (or update) all or a single Docker image
  - Created Docker images are named according to the directory of the Dockerfile under `containers` and prefixed with `vnstat/`
  - Each image needs to have the necessary build tools and development libraries installed for compiling vnStat, including the image output and tests + the `lsb_release` command that provides information about the used image (can also be a wrapper script, see `alpine:latest` for an example)
- The `jobs` directory contains directories used for creating the Jenkins jobs either directly or acting as templates
  - `gcc_template` is the template used for all jobs using `gcc` as compiler and therefore must be generic enough to work with all images
  - `gcc_jobs` contains the job -> Docker image mapping
    - The filename is the name of the job to be created
    - The single line in the file is the Docker image name to be used by the job
  - `Update_Setup` contains the Job DSL plugin script for creating and updating all jobs and views

## Notes

- Not all distributions available as containers are included in cases where the addition would result in an already existing compiler / library combination
- It's unknown if this setup works with anything else than x86-64 containers
- Doxygen plugin isn't included as it lacks pipeline support, HTML Publisher doesn't either provide a full view of the content
- Running Jenkins in a container hasn't been tested
- The number of parallelly running containers can somewhat be controlled by adjusting the number of executors of the Jenkins master
- Trying to use all this from behind a proxy is likely to require changes in several locations
- The *vnstat/debian:unstable* container has additionally `clang`, `clang-tools` and `lcov` installed
- *Stage_from_GitHub* is the only job cloning the GitHub repository, all other jobs needing the vnStat archive will copy it from this staging job in order to avoid fetching the same content multiple times
