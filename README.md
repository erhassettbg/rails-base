# rails-base
This is a base docker image for running rails web applications using nginx and phusion passenger. 

# Tags
* [1.0.0](1.0.0/Dockerfile) - Built off the official Ubuntu 18.04 image with ruby 2.5.1, nginx 1.15.12, and passenger 6.0.2.
* [2.0.0](2.0.0/Dockerfile) - Built off the official Ubuntu 18.04 image with ruby 2.7, nginx 1.15.12, and passenger 6.0.2.

## Usage
This image is best used with docker-compose. The `docker-compose.yml` in the rails app should contain the following at minimum:
```yaml
version: '3.7'

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

This image overwrites `lib/tasks` for Rails apps to include a `rake db:exists` command. If you are migrating an existing Rails application to use this base image, you should add those tasks to `<TAG>/rails` to be copied on build.
