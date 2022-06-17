### Build Image
```sh
docker build -f Dockerfile . -t sample-app
```

### Run Container
```sh
docker run -it -p 9292:9292 sample-app
```

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
