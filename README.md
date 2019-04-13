# Test OpenPathView tool chain with Ansible

**Still under construction, front is missing**

**Docker images are not on a registry, you need to build it yourself**

Need to be test with data.


## Build docker image

```
./build_all.sh
```

## Launch

```
docker-compose up
```

## Links

You can acces DirectoryManager throw FTP with port

* DirectoryManager HTTP API => [http://127.0.0.1:5005](http://127.0.0.1:5005/v1/ls)
* DirectoryManager FTP => [ftp://127.0.0.1:2121](ftp://127.0.0.1:2121)
* OPV_DBRest => [http://127.0.0.1:5000](http://127.0.0.1:5000)
* Flower => [http://127.0.0.1:5555](http://127.0.0.1:5555)

## Docs

### opensfm

We used [Dockerfile.python3](https://github.com/mapillary/OpenSfM/blob/master/Dockerfile.python3) from OpenSfM github repository.

### hugin

Hugin docker image is build on top of **opensfm** image

### opv-tasks

Is build on top of **hugin** image

### opv-celery

Is build on top of **opv-tasks** image

### opv-flower

Is build on top of **opv-celery** image

### Sumary

**opensfm <= hugin <= tasks <= opv-celery**

