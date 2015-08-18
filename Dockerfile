FROM index.tenxcloud.com/tenxcloud/centos:latest

MAINTAINER beiluo<chengbo.shen@apicloud.com>

#Install
RUN yum -y install gcc gcc-c++ vim tree make cmake autoconf openssl openssl-devel openssl-clients curl curl-devel wget rsync expect readline readline-devel bison bison-devel  pcre pcre-devel zlib-devel zlib  freetype freetype-devel tar

# Install Node
RUN   \
  cd /opt && \
  wget https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz && \
  tar -xzf node-v0.12.7-linux-x64.tar.gz && \
  mv node-v0.12.7-linux-x64 node && \
  cd /usr/local/bin && \
  ln -s /opt/node/bin/* . && \
  rm -f /opt/node-v0.12.7-linux-x64.tar.gz

# install app
ENV PREFIX /app
WORKDIR /app
# Install mongodb
ADD start.sh /start.sh
RUN chmod 755 /start.sh
ADD server $PREFIX
RUN npm install

CMD /start.sh $MONGO_PORT_27017_TCP_ADDR $MONGO_PORT_27017_TCP_PORT
