# Changelog

## [3.3.0] - 2022-04-20
### Added

* Option to configure `deploymentStrategy` for workers (either `RollingUpdate` or `Recreate`)

## [3.2.1] - 2022-03-16
### Fix
* Quote environment variable values passed to worker deployment

## [3.2.0] - 2022-03-11
### Added

* Support annotations configuration for ingress.

## [3.1.1] - 2022-03-11
### Breaking Changes
* Disable worker and migration configs by default


## [3.1.0] - 2022-03-11
### Added
* Add `K8S_POD_IP` env var which refers to the pod's IP addr

## [3.0.1] - 2022-03-10
### Fix
* Fix issue with multiple worker deployment using the same template file


## [3.0.0] - 2022-03-10
### Added
* Support to multiple workers

### Removed
* WORKER environment variables was removed

### Breaking Changes
* To support multiple workers, the workers key in the values now is a list of workers. Please check the `values.yaml` for an example.
* WORKER environment variable is not set by default anymore

## [2.2.0] - 2022-03-07

### Breaking Changes
* Make ServicePort and ContainerPort configurable.
This could cause old configs without containerPort config to fail! Review the deployment in staging before deploying to prod.


## [2.1.1] - 2022-03-03
### Fixed
* Prefix Certificate name with helm chart app name. Allows same domain to be used in different helm charts
