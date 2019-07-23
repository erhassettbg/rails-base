[![](https://images.microbadger.com/badges/image/erhassettbg/rails-base.svg)](https://microbadger.com/images/erhassettbg/rails-base "Get your own image badge on microbadger.com")
# rails-base
This is a base docker image for running rails web applications using nginx and phusion passenger. 

# Tags
* [16.04](16.04/Dockerfile) - Built off the official `ubuntu:16.04` image.
* [18.04, latest](18.04/Dockerfile) - Built off the official `ubuntu:18.04` image.

## Usage
This image is best used with docker-compose. The `docker-compose.yml` in the rails app should contain the following at minimum:
```yaml
version: '3.6'

services:
  app:
    build: .
    command: 'run.sh'
    ports:
      - '80:80'
      - '443:443'
```

The `Dockerfile` should contain:
```dockerfile
FROM erhassettbg/rails-base:<TAG>
```

It's possible that `config/master.key` in the rails app will not be able to be read by passenger and the app will not start correctly. When this happens, verify that it can be read by passenger with `chmod 644 config/master.key`.
