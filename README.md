# Geth Alpine

This Docker image contains [Geth](https://github.com/ethereum/go-ethereum) in Alpine.

The Docker image is built using multi-stage builds that also improve readibility and size.

## Commands

Get the latest version for the docker registry

> docker pull edsonalcala/geth:1.0-alpine

## Usage

You can simply run:

> docker run -t -d edsonalcala/geth:1.0-alpine 

If you want to deploy a Quorum network using this image you can check this Quorum implementation for 4 nodes:

https://github.com/EdsonAlcala/geth-n-nodes

## References

https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum
