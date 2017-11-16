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

## Running Node without docker

Run the node

`geth --rpc`

Attach to node

`geth console`

## Overview of how long it takes
https://github.com/ethereum/go-ethereum/issues/14647#issuecomment-335325502

## Development

- Compile smart contracts: `truffle compile`
- Start developemnt blockchain and console: `truffle develop`

  Within the development console:
    - Deploy contracts to the block chain from `/migrations`: `migrate`
    - Deploy changes to contracts: `migrate --reset`

## Deploying to the Live Network

- Client must be completely synced with the live network
- Client is hosting an rpc server: `geth rpc 8545`
- Client has one account registered and can sign for that account:
  - Linux keystore: `~/.ethereum/keystore/`

- To check coinbase balance in geth JS console: `web3.fromWei(eth.getBalance(ACCOUNT_ADDRESS), "ether");`
- Unlock account in geth js acount: `personal.unlockAccount(address, "password");`
- Set default account: `eth.defaultAccount=eth.coinbase;`

- To migrate: `truffle migrate --network live`

## Interacting with contract

- Create Javascript object for account: `var contract = eth.contract(ABI, CONTRACT_ADDRESS)`
- ABI for contract can be attained using the [online compiler](https://remix.ethereum.org/)
  - details/interface-ABI => copy to clipboard
