FROM index.tenxcloud.com/beiluo/nodejs:latest

MAINTAINER beiluo<chengbo.shen@apicloud.com>


# install app
ENV PREFIX /app
WORKDIR /app
# Install mongodb
ADD start.sh /start.sh
RUN chmod 755 /start.sh
ADD server $PREFIX
RUN npm install

CMD /start.sh $MONGO_93VDP_PORT_27017_TCP_ADDR $MONGO_93VDP_PORT_27017_TCP_PORT
