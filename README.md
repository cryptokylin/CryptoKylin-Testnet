# CryptoKylin-Testnet

Welcome to the CryptoKylin-Testnet

[点击查看中文](README_CN.md)

## Dependencies

- [Docker](https://docs.docker.com) Docker 17.05 or higher is required
- [docker-compose](https://docs.docker.com/compose/) version >= 1.10.0

## Clone project

```
git clone git@github.com:cryptokylin/CryptoKylin-Testnet.git
cd fullnode
```

## Setup a fullnode in 5 seconds using the shell

```
./run.sh
```

## Setup a fullnode manually in 1 minute

The first step, create the desired directory:

```
mkdir -p /data/eos/nodeos-data-volume/nodeos-data-kylin/data
```

The second step is to prepare the configuration file:

```
cp -r config /data/eos/nodeos-data-volume/nodeos-data-kylin
```

The third step, join the network:

```
docker-compose -f docker-compose-kylin-init.yaml up -d
```

## Stop/Restart syncing

To stop:

```
docker-compose -f docker-compose-kylin.yaml down
```

To restart:

```
docker-compose -f docker-compose-kylin.yaml down
docker-compose -f docker-compose-kylin.yaml up -d
```
## Chain info

```
{
  "chain_id": "5fff1dae8dc8e2fc4d5b23b2c7665c97f9e9d8edf2b6485a86ba311c25639191"
}
```

## P2P LIST

```
p2p-peer-address = 13.125.53.113:9876
p2p-peer-address = 119.254.15.40:9876
p2p-peer-address = p2p.kylin.eoseco.com:10000
p2p-peer-address = p2p-kylin.eoslaomao.com:443
p2p-peer-address = p2p.kylin-testnet.eospace.io:88
p2p-peer-address = kylin.fnp2p.eosbixin.com:443
p2p-peer-address = peering-kylin.eosasia.one:80
p2p-peer-address = kylin.meet.one:9876
p2p-peer-address = peer.kylin.alohaeos.com:9876
p2p-peer-address = p2p.kylin.helloeos.com.cn:9876
p2p-peer-address = kylin-testnet.starteos.io:9876
p2p-peer-address = kylin-fn001.eossv.org:443
```

## BNET LIST

```
bnet-connect = kylin.fnbnet.eosbixin.com:3389
bnet-connect = kylin.meet.one:4321
```

## HTTP API LIST

```
https://api.kylin-testnet.eospace.io/v1/chain/get_info
http://kylin.fn.eosbixin.com/v1/chain/get_info
https://api-kylin.eosasia.one/v1/chain/get_info
https://api-kylin.eoslaomao.com/v1/chain/get_info
http://api.kylin.eoseco.com/v1/chain/get_info
http://13.125.53.113:8888/v1/chain/get_info
http://119.254.15.40:8888/v1/chain/get_info
http://kylin.meet.one:8888/v1/chain/get_info
https://api.kylin.alohaeos.com/v1/chain/get_info
http://api.kylin.helloeos.com.cn/v1/chain/get_info
http://api-kylin.starteos.io/v1/chain/get_info
http://kylin-fn001.eossv.org/v1/chain/get_info
```

### Faucet

Creating accounts on cryptokylin is pretty simple:

#### Free Account
Create account using: http://faucet.cryptokylin.io/create_account?new_account_name

Example:
```
curl http://faucet.cryptokylin.io/create_account\?111111111ooo
```

#### Get Free tokens
Get free token with: http://faucet.cryptokylin.io/get_token?your_account_name. 

You can get 100 tokens each call and max 1000 tokens per day.

Example:
``` 
curl http://faucet.cryptokylin.io/get_token?111111111ooo
```
