# Changelog

## [1.4.2] - 2024-01-22
### Add

* Upgrade HPA from v2beta1 to v2.

## [1.4.1] - 2024-01-22
### Add

* Version skipped to due issues with HPA CPU target changes. V2 introduced the notion of usage in number versus usage as a percentage. In 1.4.1 we had CPU target utilization as number instead of usual percentage.

## [1.4.0] - 2023-12-08
### Changed

* Shorten the name of resouces by removing `hm-worker` at the end of each resource
* only headless service name is left unchanged due to backward compatibility


## [1.3.1] - 2023-08-08
### Changed

* Rename the deployment's container name to chart's full name


## [1.3.0] - 2023-07-18
### Add

* Option to enable metrics port on deployment resource.

## [1.2.0] - 2022-07-26
### Add

* Option to enable [headless service](https://kubernetes.io/docs/concepts/services-networking/service/#headless-services).


## [1.1.0] - 2022-05-04
### Add

* Option to configure [deployment strategy](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy). Default set to `RollingUpdate`


## [1.0.0] - 2022-02-06
### Add

* First release
