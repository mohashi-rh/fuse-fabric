FROM centos:7

ENV JAVA_HOME=/etc/alternatives/java_sdk
ENV FUSE_HOME /opt/jboss-fuse-6.3.0.redhat-254

RUN groupadd -g 1000 fuse
RUN useradd -r -u 1000 -m -c "Fuse role account" -g fuse -s /bin/false fuse

RUN yum update -y; \
	yum install -y iproute unzip vim java-1.8.0-openjdk-devel;

RUN chmod 777 /opt/

USER fuse

ADD jboss-fuse-karaf-6.3.0.redhat-254.zip /opt/

WORKDIR /opt

RUN	unzip jboss-fuse-karaf-6.3.0.redhat-254.zip; \
	rm -f jboss-fuse-karaf-6.3.0.redhat-254.zip; \
	ln -s jboss-fuse-6.3.0.redhat-254 fuse

WORKDIR /opt/fuse

EXPOSE 8181
EXPOSE 61616

ENTRYPOINT /opt/fuse/bin/standalone
