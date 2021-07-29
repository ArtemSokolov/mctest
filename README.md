# miccheck

A nextflow environment with exemplar data for testing the [MCMICRO pipeline](https://mcmicro.org/).

**Prerequisites**: [Docker](https://docs.docker.com/get-docker/)

**Setting the stage**

```
docker run -it --rm -e USER=$USER \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /home/$USER/work:/home/$USER/work \
  labsyspharm/miccheck:1.0.0 /bin/bash
```

where

* `-it --rm` runs the container interactively and cleans up after exiting
* `-e USER=$USER` makes your USER environmental variable visible inside the container
* `-v /var/run/docker.sock:/var/run/docker.sock` enables Docker to spawn "sister" containers
* `-v /home/$USER/work:/home/$USER/work` sets up a persistent working directory for all containers

**Running tests**

Once inside the container, you can execute [the standard tests](https://mcmicro.org/documentation/running-mcmicro.html) with

```
nextflow run labsyspharm/mcmicro -w /home/$USER/work --in /data/exemplar-001
nextflow run labsyspharm/mcmicro -w /home/$USER/work --in /data/exemplar-002 --tma
```
where `-w` tells the pipeline to use the persistent working directory.

When adding a new feature to the pipeline, fork https://github.com/labsyspharm/mcmicro and create a new branch. The feature can then be tested on the exemplars by

```
nextflow run username/mcmicro -w /home/$USER/work -r newfeature --in /data/exemplar-001
nextflow run username/mcmicro -w /home/$USER/work -r newfeature --in /data/exemplar-002 --tma
```

replacing `username` with your GitHub username and `newfeature` with the name of the branch.
