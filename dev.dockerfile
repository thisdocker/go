FROM wuyumin/upx

LABEL maintainer="Yumin Wu"

ARG GO_VERSION=1.12.1

RUN wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz \
  && tar zxf go${GO_VERSION}.linux-amd64.tar.gz -C /usr/local \
  && rm go${GO_VERSION}.linux-amd64.tar.gz \
  && echo $' \n\
export PATH=$PATH:/usr/local/go/bin \n\
' >> /etc/profile \
  && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

ENV GOROOT=/usr/local/go \
  GOPATH=/GoPath \
  GOROOT_BOOTSTRAP=/usr/local/go \
  GO111MODULE=on \
  GOPROXY=https://goproxy.io \
  # GOPROXY=https://athens.azurefd.net \
  # recommendation: move the required go bin file to /usr/local/bin/
  PATH=$PATH:/usr/local/go/bin

RUN mkdir -p "$GOPATH/src"

WORKDIR "$GOPATH/src"

# https://github.com/upx/upx

CMD ["/bin/bash"]
