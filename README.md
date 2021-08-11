# helm-charts

## Add repo:

In your local machine:
```
helm repo add hm-helm-repo https://highmobility.github.io/helm-charts/
```

Validate it:
```
# helm search repo hm
NAME                        	CHART VERSION	APP VERSION	DESCRIPTION
hm-helm-repo/hm-basic-webapp	0.1.0        	1.16.0     	A Helm chart for Kubernetes
```

## Use it:
In your helm project, add the dependency to your Chart.yaml:
```
dependencies:
- name: hm-basic-webapp
  version: 0.1.0
  repository: https://highmobility.github.io/helm-charts/
```
and run 
```
~/my-helm-project: helm dependency update
```

commit `Chart.*` files and `charts/` directory.

## Build packages and push to public page

In order to udpate the helm packages, follow these steps:
1. Bump the helm application version
2. Run lint:
```
helm lint hm-basic-webapp
```
3. Build zip file:
```
helm package hm-basic-webapp/
```
4. update the `index.yaml` file:
```
helm repo index --url https://highmobility.github.io/helm-charts/ --merge index.yaml .
```
5. Commit the zip file(s) and index.yaml and push to main
