#!/bin/bash
sudo docker stop subspace
sudo docker rm subspace
docker run \
    --name subspace \
    --restart always \
    --network host \
    --cap-add NET_ADMIN \
    --volume /data:/data \
    --env SUBSPACE_HTTP_HOST="vpn.kudi.ng" \
    --env SUBSPACE_NAMESERVER="169.254.169.254" \
    --env SUBSPACE_LISTENPORT="51820" \
    --env SUBSPACE_IPV4_POOL="10.71.240.0/20" \
    --env SUBSPACE_IPV4_GW="10.71.240.0" \
    --env SUBSPACE_LETSENCRYPT="true"\
    --env SUBSPACE_HTTP_INSECURE="false" \
    --env SUBSPACE_IPV4_PREF="10.71.240." \
    subspace:test
