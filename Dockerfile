FROM centos:latest
MAINTAINER novaeye <fcoffee@gmail.com>
ENV VERSION 1.1.3
ENV ARCH amd64

#configure go path 
ENV GOPATH /root/go 
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin

#package 
ENV PACKAGE github.com/jpillora/chisel

RUN yum update && \
        yum install golang git -y && \
        go get -v $PACKAGE && \

CMD ["/bin/sh", "-c", "/usr/local/bin/forward"]

EXPOSE 8080
