FROM scratch
MAINTAINER Eric Windisch <ewindisch@docker.com>
ADD cirros-0.3.3-x86_64-lxc.tar.gz /

# Don't configure network
RUN rm /etc/rc3.d/S40-network
RUN sed -i '/is_lxc && lxc_netdown/d' /etc/init.d/rc.sysinit
RUN curl https://gist.githubusercontent.com/viglesiasce/3adedd9bbadbad568497/raw/clucker.txt > /usr/share/cirros/logo
RUN echo 'DATASOURCE_LIST="nocloud"' > /etc/cirros-init/config
CMD ["/sbin/init"]
