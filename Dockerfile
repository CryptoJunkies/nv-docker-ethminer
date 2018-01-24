ARG runtime="nvidia"
FROM nvidia/cuda:9.0-runtime-ubuntu16.04

LABEL "maintainer"="Chris Diehl <cultclassik@gmail.com>"

# NVidia required
ENV NVIDIA_VISIBLE_DEVICES=0

ENV EMREL="https://github.com/ethereum-mining/ethminer/releases/download/v0.13.0/ethminer-0.13.0-Linux.tar.gz"

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /ethminer \
 && wget --no-check-certificate $EMREL \
 && tar -xvf ./*.tar.gz  -C /ethminer --strip-components 1 \
 && rm *.tar.gz

WORKDIR /ethminer

RUN echo '/ethminer/bin/ethminer -RH -U -S $POOL1 -FS $POOL2 -O $ETH_ACCT.$WORKER --cuda-parallel-hash $CUDAPH --api-port 3333' > start.sh

EXPOSE 3333/tcp

ENTRYPOINT [ "/ethminer/bin/ethminer" ]
CMD [ "-RH", "-U", "-S", "pool_1_url", "-FS", "pool_2_url", "-O", "eth_address" ]
