# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [1.2.0] - 2016-06-13

- upgraded ansible to 2.1.0.0

## [1.1.2] - 2016-04-20

- fixed pythonpath issue - https://github.com/omniti-labs/ansible-dk/issues/63

## [1.1.1] - 2016-03-17

- fixed ansible-dk cli path issue - https://github.com/omniti-labs/ansible-dk/issues/61

## [1.1.0] - 2016-03-14

- Removed ansible-toolkit - https://github.com/omniti-labs/ansible-dk/issues/58
- Moved omnibus project to top level
- Added verify subcommand to ansible-dk cli to verify internal tools

## [1.0.0] - 2016-03-07

### Updated tools (jblancett)
- ansible is now at 2.0.0.2
- python is now at 2.7.11
- ruby is now at 2.1.8
- all other built in tools have been updated to their latest available versions

### Improvements
- several fixes and improvements to debian build process (clintoncwolfe, jblancett)
- replaced ansible-dk cli tool with a more robust python one (mbrannigan, jblancett)

## [0.2.0] - 2016-01-04

### Added Tools
- molecule 1.0.6 (dhutty)
- bats 0.4.0 (clintoncwolfe)

### Fixes
- added automake dep to jq to fix build error (clintoncwolfe)
- added ~/.ansible-dk/python/bin to PATH (bborysenko)
- README fixes/updates (dhutty, clintoncwolfe, IndyMichaelB)

## [0.1.0] 2015-11-11

Initial public release

### Added OS Packaging
- Ubuntu 14.04
- MacOS 10.10+

### Added Tools

- ansible 1.9.4
- ansible-lint 2.1.3
- ansible-toolkit 1.3.2
- awscli 1.9.5
- jq 1.5
- kitchen-ansible 0.0.30
- kitchen-vagrant 0.19.0
- serverspec  2.24.2
- test-kitchen 1.4.2
