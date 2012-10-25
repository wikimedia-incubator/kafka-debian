# Debian packaging for Apache Kafka

This package is meant to build .deb packaging for the Apache Kafka project.
This .deb package that is built will install the full Kafka source directory
along with compiles classes and .jar files into ```/usr/lib/kafka```.
```/usr/lib/kafka/config``` will be symlinked to ```/etc/kafka```.  An
```/etc/init/kafka.conf``` upstart script will allow you to start and stop
Kafka brokers as a service.

Note:  This has only been tested on Ubuntu 12.04 LTS.

## Instructions
- [Download](http://incubator.apache.org/kafka/downloads.html) Apache Kafka:

```bash
wget http://apache.petsads.us/incubator/kafka/kafka-0.7.2-incubating/kafka-0.7.2-incubating-src.tgz
```

- Unzip the source:

```bash
tar -xzf kafka-0.7.2-incubating-src.tgz 
```

- Clone this respository into a debian/ directory

```bash
cd kafka-0.7.2-incubating-src && git clone https://github.com/wmf-analytics/kafka-debian.git ./debian
```

- Run the buildpackage.sh script

```bash
debian/buildpackage.sh
```

If all goes well, you will have a ```kafka_0.7.2_all.deb``` package.

Run this as a single command to do all of the above steps at once:

```bash
wget http://apache.petsads.us/incubator/kafka/kafka-0.7.2-incubating/kafka-0.7.2-incubating-src.tgz && tar -xzf kafka-0.7.2-incubating-src.tgz && cd kafka-0.7.2-incubating-src && git clone https://github.com/wmf-analytics/kafka-debian.git ./debian && debian/buildpackage.sh
```