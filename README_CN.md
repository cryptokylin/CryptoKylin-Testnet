# CryptoKylin-Testnet

欢迎来到 CryptoKylin-Testnet

[View in English](README.md)

## 依赖

- [Docker](https://docs.docker.com) Docker版本 >= 17.05
- [docker-compose](https://docs.docker.com/compose/) 版本 >= 1.10.0

## 克隆项目

```
git clone git@github.com:cryptokylin/CryptoKylin-Testnet.git
cd fullnode
```

## 5秒之内搭建一个全节点

```
./run.sh
```

## 1分钟内手动搭建全节点

第一步，创建所需要的目录:

```
mkdir -p /data/eos/nodeos-data-volume/nodeos-data-kylin
mkdir -p /data/eos/nodeos-data-volume/nodeos-data-kylin
```

第二步，准备配置文件:

```
cp -r config.ini /data/eos/nodeos-data-volume/nodeos-data-kylin
cp -r genesis.json /data/eos/nodeos-data-volume/nodeos-data-kylin
```

第三步，启动全节点

```
docker-compose -f docker-compose-kylin-init.yml up -d
```

## 暂停/重启 同步

暂停:

```
docker-compose -f docker-compose-kylin.yml down
```

重启:

```
docker-compose -f docker-compose-kylin.yml down
docker-compose -f docker-compose-kylin.yml up -d
```
## 链信息

```
{
  "chain_id": "b4f5c76fd8bfa2bfb3afb9ad6733f930e0a43c13eaec8f5a642d3a41d88935bc"
}
```

## P2P 节点列表

```
p2p-peer-address = 13.125.53.113:9876
p2p-peer-address = 35.231.136.15:9878
p2p-peer-address = p2p.kylin.eoseco.com:10000
p2p-peer-address = 104.155.193.66:9876
p2p-peer-address = p2p.kylin-testnet.eospace.io:88
p2p-peer-address = kylin.fnp2p.eosbixin.com:1080
p2p-peer-address = peering-kylin.eosasia.one:80

```

## BNET 节点列表

```
bnet-connect = kylin.fnbnet.eosbixin.com:1081
```

## HTTP API 节点列表

```
http://api.kylin-testnet.eospace.io/v1/chain/get_info
http://kylin.fn.eosbixin.com/v1/chain/get_info
http://13.125.53.113:8888/v1/chain/get_info
http://api-kylin.eosasia.one
https://api-kylin.eosasia.one
http://api.kylin.eoseco.com/v1/chain/get_info
```
