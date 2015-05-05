# debian-datomic-free-transactor 

Docker image for running a datomic transactor. This image downloads the datomic free edition. Be sure to agree with the [Datomic Free Edition License](https://my.datomic.com/datomic.com/datomic-free-edition-license.html). 

More information about the [Datomic pricing model](http://www.datomic.com/pricing.html) 

## Usage

The image starts the datomic free transactor. However, you still need to supply the transactor properties file. Datomic is installed in /opt/datomic in the container, and it starts from that directory. Mounting a volume to e.g. /opt/datomic/config is pretty straight forward. Make sure you got a valid transactor.properties (or however you call it) file in the mounted volume:

```
docker run -v [host-path]:/opt/datomic/conf simplexsys/debian-datomic-free-transactor -Xms256m -Xmx512m conf/transactor.properties
```

Just for fun, I added some memory settings as well.

Of course, you can use [Docker data volumes](https://docs.docker.com/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container) as well.

The default datomic transactor port 4334 is exposed.
