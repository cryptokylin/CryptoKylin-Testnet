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
mkdir -p /data/eos/nodeos-data-volume/nodeos-data-kylin
mkdir -p /data/eos/nodeos-data-volume/nodeos-data-kylin
```

The second step is to prepare the configuration file:

```
cp -r config.ini /data/eos/nodeos-data-volume/nodeos-data-kylin
cp -r genesis.json /data/eos/nodeos-data-volume/nodeos-data-kylin
```

The third step, join the network:

```
docker-compose -f docker-compose-kylin-init.yml up -d
```

## Stop/Restart syncing

To stop:

```
docker-compose -f docker-compose-kylin.yml down
```

To restart:

```
docker-compose -f docker-compose-kylin.yml down
docker-compose -f docker-compose-kylin.yml up -d
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
p2p-peer-address = 35.231.136.15:9878
p2p-peer-address = p2p.kylin.eoseco.com:10000
p2p-peer-address = p2p-kylin.eoslaomao.com:443
p2p-peer-address = p2p.kylin-testnet.eospace.io:88
p2p-peer-address = kylin.fnp2p.eosbixin.com:1080
p2p-peer-address = peering-kylin.eosasia.one:80
```

## BNET LIST

```
bnet-connect = kylin.fnbnet.eosbixin.com:1081
```

## HTTP API LIST

```
http://api.kylin-testnet.eospace.io/v1/chain/get_info
http://kylin.fn.eosbixin.com/v1/chain/get_info
http://13.125.53.113:8888/v1/chain/get_info
http://api-kylin.eosasia.one
https://api-kylin.eosasia.one
https://api-kylin.eoslaomao.com
http://api.kylin.eoseco.com/v1/chain/get_info
```

### Faucet
you can get 100 tokens each call and max 1000 tokens per day. 
``` 
curl http://13.125.53.113/get_token?<your-account-name>
```
