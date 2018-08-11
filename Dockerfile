ARG runtime="nvidia"
FROM nvidia/cuda:9.2-runtime-ubuntu18.04

LABEL "maintainer"="Chris Diehl <cultclassik@gmail.com>"

# NVidia required
ENV NVIDIA_VISIBLE_DEVICES=0

ENV EMREL="https://github.com/ethereum-mining/ethminer/releases/download/v0.15.0/ethminer-0.15.0-Linux.tar.gz"

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /ethminer \
 && wget --no-check-certificate $EMREL \
 && tar -xvf ./*.tar.gz  -C /ethminer --strip-components 1 \
 && rm *.tar.gz

WORKDIR /ethminer

EXPOSE 3333/tcp

ENTRYPOINT [ "/ethminer/ethminer" ]
CMD [ "-R", "-U", "-P", "pool_1_url" ]
