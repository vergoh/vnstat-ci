# vnStat CI Setup

This repository contains the files used to setup the CI environment for [vnStat](https://humdi.net/vnstat/) testing. The setup is intended for running `make check` and other tooling easily for multiple distributions resulting in multiple compiler and library version combinations getting tested.

Triggers to content changes in the [actual repository](https://github.com/vergoh/vnstat) have been intentionally left out. Some content may also unintentionally be missing.

## Requirements

- Docker
- Jenkins with Docker connectivity
  - Using latest LTS release is suggested
- Following Jenkins plugins:
  - Pipeline
  - Git
  - File System SCM
  - HTML Publisher
  - Job DSL
  - Warnings Next Generatior
  - Copy Artifact
  - Environment Injector
  - Sectioned View
  - Timestamper

Some plugins may be missing from the list as a scratch install hasn't been tested.

## Getting started

1. Setup Jenkins
2. Edit `CI_DIR` in `jobs/Update_Setup/Jenkinsfile` to match the checkout  directory of this repository
3. Create new Pipeline job named *Update_Setup*
   - Select Pipeline script from SCM and File System for SCM
   - Set path to checkout directory + `jobs/Update_Setup`
   - Keep script path as default (`Jenkinsfile`)
   - Save
4. Build *Update_Setup*
   - This will create rest of the necessary jobs and the *vnStat* view
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

## Notes

- Not all distributions available as containers are included in cases where the addition would result in an already existing compiler / library combination
- It's unknown if this setup works with anything else than x86-64 containers
- Doxygen plugin isn't included as it lacks pipeline support, HTML Publisher doesn't either provide a full view of the content
- Running Jenkins in a container hasn't been tested
- The number of parallelly running containers can somewhat be controlled by adjusting the number of executors of the Jenkins master
- Trying to use all this from behind a proxy is likely to require changes in several locations
- The *vnstat/debian:unstable* container has additionally `lcov` installed
