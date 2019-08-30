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
p2p-peer-address = kylinnet.eosstore.link:9876
p2p-peer-address = 119.254.15.40:9876
p2p-peer-address = 39.108.231.157:23225
p2p-peer-address = p2p.kylin.eoseco.com:10000
p2p-peer-address = p2p-kylin.eoslaomao.com:443
p2p-peer-address = p2p.kylin-testnet.eospacex.com:88
p2p-peer-address = kylin.fnp2p.eosbixin.com:443
p2p-peer-address = peering-kylin.eosasia.one:80
p2p-peer-address = kylin.meet.one:9876
p2p-peer-address = peer.kylin.alohaeos.com:9876
p2p-peer-address = p2p.kylin.helloeos.com.cn:9876
p2p-peer-address = kylin-testnet.starteos.io:9876
p2p-peer-address = kylin-fn001.eossv.org:443
p2p-peer-address = kylin-fn001.eossv.org:443
p2p-peer-address = api-kylin.eoshenzhen.io:9876
p2p-peer-address = p2p.kylin.eosbeijing.one:8080
p2p-peer-address = testnet.zbeos.com:9876
```

## BNET LIST

```
bnet-connect = kylin.fnbnet.eosbixin.com:3389
bnet-connect = kylin.meet.one:4321
```

## HTTP API LIST

API nodes:
```
http://39.108.231.157:30065/v1/chain/get_info
https://api.kylin-testnet.eospacex.com/v1/chain/get_info
http://kylin.fn.eosbixin.com/v1/chain/get_info
http://api.kylin.eoseco.com/v1/chain/get_info
http://178.62.36.41:8888/v1/chain/get_info
https://api.kylin.alohaeos.com/v1/chain/get_info
http://api.kylin.helloeos.com.cn/v1/chain/get_info
https://kylin.eoscanada.com/v1/chain/get_info
http://api-kylin.starteos.io/v1/chain/get_info
http://api.kylin.eosbeijing.one:8880/v1/chain/get_info
http://kylin-testnet.jeda.one:8888/v1/chain/get_info
http://kylin.meet.one:8888/v1/chain/get_info
```

API nodes support get actions ( filter-on=* ):
```
https://api-kylin.eoslaomao.com/v1/chain/get_info
https://api-kylin.eosasia.one/v1/chain/get_info
```

## Faucet

Creating accounts on cryptokylin is pretty simple:

#### Free Account
Create account using: http://faucet.cryptokylin.io/create/new_account_name

Example:
```
curl http://faucet.cryptokylin.io/create/111111111ooo
```


#### Get Free tokens
Get free token with: http://faucet.cryptokylin.io/get_token/your_account_name.
You can get 100 tokens each call and max 1000 tokens per day.  

Example:
``` 
curl http://faucet.cryptokylin.io/get_token/111111111ooo
```

## Backup files (Not in maintenance)

For those of you who want to sync fast to the latest block, you can use these backup files here:

#### Docker version

- https://storage.googleapis.com/eos-kylin-backup

#### Non docker version

- https://s3-ap-northeast-1.amazonaws.com/cryptokylin-eosstore/index.html

### How to use backup
#### docker version
- First get the back-up from the https://storage.googleapis.com/eos-kylin-backup 
```
   wget https://storage.googleapis.com/eos-kylin-backup/kylin-20181114060001.zip
```
- Decompress the package to the path which in your config,and modify name which in your config 
```
   tar -zxvf kylin-20181114060001.zip -C /
   cd /data/eos/nodeos-data-volume/
   mv nodeos-data-eospace-kylinbackup2 nodeos-data-kylin
```
- Start docker 
```
   docker-compose -f docker-compose-kylin.yaml up -d
```

#### Non docker version
- First get the latest back-up from the https://s3-ap-northeast-1.amazonaws.com/cryptokylin-eosstore/index.html 
- Decompress the package to the path which in your nodeos's config
- Start nodeos
- method of operation dails:https://github.com/zsq978663747/eos-doc/blob/master/eos_block_backup_cn.md 
