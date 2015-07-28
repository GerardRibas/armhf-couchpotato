FROM armv7/armhf-archlinux
MAINTAINER Gerard Ribas <gerard.ribas.canals@gmail.com>

ENV PACMAN_PACKAGES couchpotato-git

RUN pacman -Sy --needed ${PACMAN_PACKAGES} --noconfirm

ENV RUN_USER   daemon
ENV RUN_GROUP  daemon

RUN chown -R ${RUN_USER}:${RUN_GROUP} /usr/bin/python2 \
    && chmod +x /usr/bin/python2                       \
    && yes|pacman -Scc                                 \
    && rm -rf /usr/share/locale/*                      \
    && rm -rf /usr/share/man/*                         \
    && rm -rf /tmp/*

VOLUME /config
VOLUME /media

#Web Interface
EXPOSE 5050

USER ${RUN_USER}:${RUN_GROUP}

CMD ["/usr/bin/python2","/opt/couchpotato/CouchPotato.py","--data_dir","/config/","--config_file","/config/CouchPotato.cfg"]
