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
mkdir -p /data/eos/nodeos-data-volume/nodeos-data-kylin/data
```

第二步，准备配置文件:

```
cp -r config /data/eos/nodeos-data-volume/nodeos-data-kylin
```

第三步，启动全节点

```
docker-compose -f docker-compose-kylin-init.yaml up -d
```

## 暂停/重启 同步

暂停:

```
docker-compose -f docker-compose-kylin.yaml down
```

重启:

```
docker-compose -f docker-compose-kylin.yaml down
docker-compose -f docker-compose-kylin.yaml up -d
```
## 链信息

```
{
  "chain_id": "5fff1dae8dc8e2fc4d5b23b2c7665c97f9e9d8edf2b6485a86ba311c25639191"
}
```

## P2P 节点列表

```
p2p-peer-address = 13.125.53.113:9876
p2p-peer-address = 119.254.15.40:9876
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
p2p-peer-address = p2p.kylin.eosbeijing.one:8080
p2p-peer-address = testnet.zbeos.com:9876
```

## BNET 节点列表

```
bnet-connect = kylin.fnbnet.eosbixin.com:3389
bnet-connect = kylin.meet.one:4321
```

## HTTP API 节点列表

API nodes:
```
http://39.108.231.157:30065/v1/chain/get_info
https://api.kylin-testnet.eospacex.com/v1/chain/get_info
http://kylin.fn.eosbixin.com/v1/chain/get_info
http://api.kylin.eoseco.com/v1/chain/get_info
http://13.125.53.113:8888/v1/chain/get_info
http://119.254.15.40:8888/v1/chain/get_info
https://api.kylin.alohaeos.com/v1/chain/get_info
http://api.kylin.helloeos.com.cn/v1/chain/get_info
http://api-kylin.starteos.io/v1/chain/get_info
http://kylin-fn001.eossv.org/v1/chain/get_info
http://api-kylin.eoshenzhen.io:8890/v1/chain/get_info
http://api.kylin.eosbeijing.one:8880/v1/chain/get_info
http://testnet.zbeos.com/v1/chain/get_info
```

支持 `get actions` ( filter-on=* ) 的API:
```
https://api-kylin.eoslaomao.com/v1/chain/get_info
https://api-kylin.eosasia.one/v1/chain/get_info
https://api-kylin.meet.one/v1/chain/get_info
```

## 水龙头

在 `cryptokylin` 上创建账号非常简单:

#### 免费账号
创建免费账号: http://faucet.cryptokylin.io/create_account?new_account_name

例子:
```
curl http://faucet.cryptokylin.io/create_account\?111111111ooo
```

#### 获得免费Token
获得免费Token: http://faucet.cryptokylin.io/get_token?your_account_name. 
每一次调用能获得100EOS, 每天最多获得1000个EOS.

例子:
``` 
curl http://faucet.cryptokylin.io/get_token?111111111ooo
```
或者
```
curl http://13.230.87.138:80/get_token?111111111ooo
```

## 备份文件

可以通过下列备份文件快速同步麒麟测试网节点:

#### Docker 版本

- https://storage.googleapis.com/eos-kylin-backup

#### 非 docker 版本

- https://s3-ap-northeast-1.amazonaws.com/cryptokylin-eosstore/index.html

### 如何使用备份
#### docker版本
- 首先通过网址获取到最新的备份数据，例如：
```
   wget https://storage.googleapis.com/eos-kylin-backup/kylin-20181114060001.zip
```
- 在本地把数据解压到自己的配置文件中的路径下，并且修改自己配置文件中写的文件夹的名称，例如：
```
   tar -zxvf kylin-20181114060001.zip -C /
   cd /data/eos/nodeos-data-volume/
   mv nodeos-data-eospace-kylinbackup2 nodeos-data-kylin
```
- 启动docker 
```
   docker-compose -f docker-compose-kylin.yaml up -d
```

#### 非docker版本
- 首先访问网址，获取到最新的备份数据  
- 把数据解压到自己的配置文件中的指定路径下
- 启动nodeos程序
- 详细操作：https://github.com/zsq978663747/eos-doc/blob/master/eos_block_backup_cn.md





