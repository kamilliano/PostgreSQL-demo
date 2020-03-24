# postresql-demo
PostreSQL demo repo

# Setup notes for notebook

To check all required components and optional components, pipenv and pyenv, for the project run:

    make check_system

This should give you similar output:

    # System details
    LSB Version:    core-9.20170808ubuntu1-noarch:security-9.20170808ubuntu1-noarch
    Distributor ID: Ubuntu
    Description:    Ubuntu 18.04 LTS
    Release:        18.04
    Codename:       bionic
    # Docker components
    Docker version 18.06.3-ce, build d7080c1
    docker-compose version 1.23.2, build 1110ad01
    # Pipenv version
    pipenv, version 2018.11.26
    # Pyenv version
    pyenv 1.2.17-1-g89786b90

# Running project

To start docker containers:

    make run

To stop either `Ctrl+c` or:

    make stop

# Notes on running `pyenv` with `pipenv`

When using pyenv to set up local python 3.7.7 version use:

    pyenv install 3.7.7

then

    pyenv local 3.7.7

This seems to be working fine, however, pipenv is having a bit of a struggle so I have to specify full path to python binary:

    pipenv install notebook --python=/home/[MYUSERNAME]/.pyenv/versions/3.7.7/bin/python

