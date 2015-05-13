# debian-datomic-free-transactor 

Docker image for running a datomic transactor. This image downloads the datomic free edition. Be sure to agree with the [Datomic Free Edition License](https://my.datomic.com/datomic.com/datomic-free-edition-license.html). 

More information about the [Datomic pricing model](http://www.datomic.com/pricing.html) 

## Usage

The image starts the datomic free transactor. However, you still need to supply the transactor properties file. Datomic is installed in `/usr/share/datomic` in the container, and it starts from that directory. Mounting a volume to e.g. `/etc/datomic` (bind-mounted to `/usr/share/datomic/config`) is pretty straight forward. Make sure you got a valid `transactor.properties` file (or however you call it) in the mounted volume:

```
docker run -v [host-path]:/etc/datomic simplexsys/debian-datomic-free-transactor -Xms256m -Xmx512m conf/transactor.properties
```

Just for fun, I added some memory settings as well.

Of course, you can use [Docker data volumes](https://docs.docker.com/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container) as well.

The default datomic transactor port 4334 is exposed.

## Minimal config for testing

A minimal config file (transactor.properties), just for quick testing, inclusive durability to data:

```
protocol=free
host=localhost
port=4334

memory-index-threshold=8m
memory-index-max=32m
object-cache-max=32m

data-dir=data

write-concurrency=2

read-concurrency=2
```

This lets the transactor run in a pretty small RAM-footprint:

```
docker run -v [host-config directory]:/etc/datomic -v [host-data directory]:/var/lib/datomic simplexsys/debian-datomic-free -Xms64m -Xmx96m conf/transactor.properties
```

Of course, the `-v` flags can be replaced by a [Docker data volume](https://docs.docker.com/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container) using `volume-from`.
