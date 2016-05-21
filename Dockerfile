FROM centos:latest
MAINTAINER novaeye <fcoffee@gmail.com>
ENV VERSION 0.0.1
ENV ARCH amd64

#configure go path 
ENV GOPATH /root/go 
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin

#package 
ENV PACKAGE github.com/jpillora/chisel

RUN yum update && \
        yum install golang git -y && \
        go get -v -u $PACKAGE
        
# add a startup script
COPY forward /usr/local/bin

CMD ["/bin/sh", "-c", "/usr/local/bin/forward"]
#CMD ["chisel", "server", "--proxy http://localhost"]

EXPOSE 8080 22
