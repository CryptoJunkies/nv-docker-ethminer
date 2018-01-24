# nv-docker-ethminer [![Build Status](https://travis-ci.org/CultClassik/nv-docker-ethminer.svg?branch=master)](https://travis-ci.org/CultClassik/nv-docker-ethminer)
[Image on Docker Hub](https://hub.docker.com/r/cryptojunkies/ethminer/)

Dockerfile to build cryptojunkies/ethminer GPU container for use with ethermine.org.

## Pre-requisites

Requires a working installation of Docker CE or EE and Nvidia-Docker2.

## Installation

docker build -t cryptojunkies/ethminer:latest-cuda9.0 .

## Usage

docker run --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0 cryptojunkies/ethminer:latest-nv "-RH -U -S pool_1_url -FS pool_2_url -O eth_address"

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

Ethminer 0.12.0, Updated from nvidia-docker to nvidia-docker2 on 12-11-17.

Ethminer 0.13.0, Moved to new repo / updated ethminer to 0.13.0 / updated Cuda to 9.0

## Credits

TODO: Write credits

## License

TODO: Write license