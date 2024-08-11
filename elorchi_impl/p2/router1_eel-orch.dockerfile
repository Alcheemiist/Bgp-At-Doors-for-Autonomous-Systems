FROM frrouting/frr
COPY ./frr_daemons.conf /etc/frr/daemons
COPY ./router1_setup.sh /router_setup.sh
#CMD ["sh", "/router_setup.sh"]
