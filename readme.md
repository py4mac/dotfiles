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
