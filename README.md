![](https://www.docker.com/sites/all/themes/docker/assets/images/logo.png)
# Overview

This Docker container makes easier to get an instance of Couch Potato up and running in ARMv7 (armhf) platform such as Raspberry 2, Utilite, Cubox-i, Odroid...

Base Image used [armv7/armhf-archlinux](https://registry.hub.docker.com/u/armv7/armhf-archlinux/), thanks to[@umiddelb](https://github.com/umiddelb)

# Quick Start

The Couch Potato config directory is used to store all the configuration, I recommend mounting it as a host directory using the [data volume](https://docs.docker.com/userguide/dockervolumes/#mount-a-host-directory-as-a-data-volume)
	
Couch Potato will be run by daemon user. The first step is to make sure that daemon user is the owner of the ```config``` folder:
	
	docker run -u root -v /host/data/couchpotato:/config gerardribas/armhf-couchpotato chown -R daemon /config

The container accepts another volume to be passed on ```/media``` which is the root media folder to be scanned by Couch Potato.

The container exposes the Web Interface Port on 5050.

### Start Couchpotato Container:

	docker run -v /host/data/couchpotato:/config -v /host/media:/media --name="couchpotato" -d -p 5050:5050 gerardribas/armhf-couchpotato

**Success**. Your Couch Potato Server is now ready to be used! Well done! 

Should be available on http://<your_domain>:5050

### Linking Containers

If you want, you can link containers like [Transmission Container] (https://registry.hub.docker.com/u/gerardribas/armhf-transmission/) together. Start your container with ```--link <TransmissionContainerName>``` 

	docker run -v /host/data/couchpotato:/config -v /host/media:/media --name="couchpotato" -d -p 5050:5050 --link transmission gerardribas/armhf-couchpotato

Then you can set up couch potato to download torrents with Transmission entering the url: http://transmission:9091

# Issue tracker

Please raise an [issue](https://github.com/GerardRibas/armhf-couchpotato/issues/new)if you encounter any problems with this Dockerfile.