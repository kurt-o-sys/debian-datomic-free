FROM simplexsys/debian-zulu-jdk:latest
MAINTAINER qsys <kurt.sys@gmail.com>

RUN apt-get install html2text less

RUN echo Be sure you agree with the license of datomic free: &&\
	curl -L https://my.datomic.com/datomic.com/datomic-free-edition-license.html | html2text - | less 

ENV DATOMIC_VERSION 0.9.5153

RUN (curl -L https://my.datomic.com/downloads/free/${DATOMIC_VERSION} -o /tmp/datomic-free.zip &&\
     unzip /tmp/datomic-free.zip -d /opt &&\
     rm /tmp/datomic-free.zip)
RUN ln -s /opt/datomic-free-${DATOMIC_VERSION} /opt/datomic

RUN echo Be sure you agree with the license of datomic free - see above

WORKDIR "/opt/datomic/"

ENTRYPOINT ["./bin/transactor"]
EXPOSE 4334
