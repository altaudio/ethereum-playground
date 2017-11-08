# Run a node

*This takes time!*

## Machine Requirements

You need decent memory (at least 4GB to spare), an SSD (without was taking AGES), fast internet.

I used Linode in the end.

## Prerequisite Installs

Install Docker.

## Running

Run the node

`docker run -p 8545:8545 -p 30303:30303 -d -v /root/.ethereum:/root/.ethereum --restart always ethereum/client-go --syncmode=fast --cache 4096 --rpc`

Attach to the node
`docker run -it -v /root/.ethereum/:/root/.ethereum/ ethereum/client-go attach`

## Overview of how long it takes
https://github.com/ethereum/go-ethereum/issues/14647#issuecomment-335325502
