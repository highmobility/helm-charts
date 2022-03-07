# Changelog

## [2.2.0] - 2022-03-07

### Breaking Changes
* Make ServicePort and ContainerPort configurable.
This could cause old configs without containerPort config to fail! Review the deployment in staging before deploying to prod.


## [2.1.1] - 2022-03-03
### Fixed
* Prefix Certificate name with helm chart app name. Allows same domain to be used in different helm charts
