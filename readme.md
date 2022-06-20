# Dotfiles configuration files

Inspired by: https://github.com/kespinola/dotfiles

Target embedded software development:
- arm toolchain
- ceedling tool
- plantuml
- rust
- yocto utils
...

## Environment configuration

### Preparing local file

Configuration file is located [here](./group_vars/local)

### Option1 - Installing it on a new machine
This command installs all required packages
```sh
$ ./bin/dot-bootstrap env
```

### Option2 - Installing it inside a container

This command installs all required packages
```sh
$ ./bin/dot-bootstrap venv
```

In order to build dockerfile, you can run the following command
```sh
$ docker build -t virtual-env .
```

As an example, to run it using docker-compose

```sh
services:
  virtual-env:
    image: virtual-env
    volumes:
      - ./workspace:/home/dev/workspace
    secrets:
      - user_ssh_key
secrets:
  user_ssh_key:
    file: ~/.ssh/id_rsa
```