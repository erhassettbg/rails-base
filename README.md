[![](https://images.microbadger.com/badges/image/erhassettbg/rails-base:18.04.svg)](https://microbadger.com/images/erhassettbg/rails-base:18.04 "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/erhassettbg/rails-base:18.04.svg)](https://microbadger.com/images/erhassettbg/rails-base:18.04 "Get your own version badge on microbadger.com")
# rails-base
This is a base docker image for running rails web applications using nginx and phusion passenger. 

# Tags
* [16.04](Dockerfile-16.04) - Built off the official `ubuntu:16.04` image.
* [18.04, latest](Dockerfile-18.04) - Built off the official `ubuntu:18.04` image.

## Usage
This image is best used with docker-compose. The `docker-compose.yml` in the rails app should contain the following at minimum:
```yaml
version: '3'

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

This image overwrites `lib/tasks` for Rails apps to include a `rake db:exists` command. If you are migrating an existing Rails application to use this base image, you should add those tasks to `<TAG>/rails` to be copied on build.
