FROM centos:7

RUN \
  yum update -yqq && \
  yum install -yqq \
  net-tools telnet curl wget ncat iputils \
  vim tree which htop \
  make gcc

# ENV REDIS_EVRSION=5.0.5

# WORKDIR /root

# RUN \
#   wget http://download.redis.io/releases/redis-${REDIS_EVRSION}.tar.gz && \
#   tar xzf redis-${REDIS_EVRSION}.tar.gz && \
#   ln -sf redis-${REDIS_EVRSION} redis && \
#   cd redis && \
#   make -j4 && \
#   make install

COPY files/docker /docker
COPY files/var/log/docker /var/log/docker

# COPY files/var/redis /var/redis
# EXPOSE 6379 26379

ENV KEEP_RUNNING=0

ENTRYPOINT [ "/docker/entrypoint.sh" ]
CMD [ "here we are" ]
