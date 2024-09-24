## Images
### Build Images
```sh
docker build -f Dockerfile.web . -t sample-app:web
docker build -f Dockerfile.worker . -t sample-app:worker
docker build -f Dockerfile.worker . -t sample-app:migration
```

### Run Containers
```sh
docker run -it -p 9292:9292 sample-app:web
docker run -it sample-app:worker
docker run -it sample-app:migration
```

## Helm
### Deploy
```sh
helm install sample-app-web helm-web/
helm install sample-app-worker helm-worker/
```

## Application
### Server
```sh
rackup --host 0.0.0.0
```

### Worker
```sh
ruby worker.rb
```

### Migration
```sh
ruby migration.rb
```
