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

In order to update the helm packages, follow these steps:
1. Bump the helm application version
2. Update the CHANGELOG.md in the chart
3. Run lint:
```
helm lint hm-basic-webapp
```
4. Build zip file:
```
mkdir -p artifact-tmp
helm package hm-basic-webapp --destination artifact-tmp 
```
5. update the `index.yaml` file:
```
helm repo index --url https://highmobility.github.io/helm-charts/ --merge index.yaml artifact-tmp
```
6. Move the new files to the root dir
```
mv artifact-tmp/* ./
rm -rf artifact-tmp
```
7. Commit the zip file(s) and index.yaml and push to main
