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

## Test it

You need data to test

### Install OPV_Import

[See OPV_importData](https://github.com/OpenPathView/OPV_importData)

### Import data

```bash
opv-make-lot --csv-path=picturesInfo.csv --api-uri=http://127.0.0.1:5000 --dm-uri=http://127.0.0.1:5005 SD
```

### Launch it

Connect to the docker:

```bash
docker exec -it docker_celery_1 /bin/bash
```

Launch it

```bash
opv-celery-campaign 1 42
```

[See progress here](http://127.0.0.1:5555) [and in OPV_Status](http://127.0.0.1:80)

## Links

You can acces DirectoryManager throw FTP with port

* OPV_Status => [http://127.0.0.1:80](http://127.0.0.1:80)
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


