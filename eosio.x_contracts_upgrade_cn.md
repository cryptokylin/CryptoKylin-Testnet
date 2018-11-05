

##  eosio.contracts 合约升级方法
为了在EOS主网更新合约前对合约功能及安全性等进行验证，当[eosio.contracts](https://github.com/EOSIO/eosio.contracts)发布新版本后，
需将新合约部署到Kylin测试网络进行测试。更新合约的方式是使用多签的方案，任何人都可以发起更新申请，待三分之二以上Top 21 BPs通过后，可以执行提交的更新申请。

### 具体步骤
``` bash
# step 1: build eosio.contracts and check generated *.abi files.

#说明: 自动生成的abi文件一般是不完整的，需要手动修改才能正常工作。你可以参考[github.com/cryptokylin/eosio.contracts](https://github.com/cryptokylin/eosio.contracts)的
#v1.4.0-fixed分支，此分支补全了abi文件中缺失的内容。

git clone https://github.com/cryptokylin/eosio.contracts
cd eosio.contracts && git checkout v1.4.0-fixed
./build.sh

# step 2: generate transaction json files
home_dir=`cd && pwd`
tmp_dir="${home_dir}/tmp/eosio.contracts.v1.4.0"
mkdir -p ${tmp_dir} && cd ${tmp_dir}

repo_dir=<your eosio.contracts repo absolute directory>  # such as repo_dir='/Code/github.com/cryptokylin/eosio.contracts'
build_dir=${repo_dir}/build
alias cleos='cleos -u https://api.eosstore.co' 
for c in token msig system wrap; do \
cleos set contract eosio ${build_dir}/eosio.${c} -j -d -s > eosio.${c}.update_tx.json; done

# step 3: modify these json files.

expiration="2018-11-10T12:00:00"

for file in `ls`; do 
sed s/.*\"expiration\":.*/\ \ \"expiration\":\ \"${expiration}\",/g  ${file} |\
sed s/.*\"ref_block_num\":.*/\ \ \"ref_block_num\":\ 0,/g                    |\
sed s/.*\"ref_block_prefix\":.*/\ \ \"ref_block_prefix\":\ 0,/g  > ${file}.m ; done

rm *.json


# step 4: get requested_permissions json file.

## get top 21 bp names
bps=`cleos system listproducers -l 21 | head -n 22 |tail -n 21 | cut -d ' ' -f1`

## generate permissions.json
f=permissions.json && i=0
echo [ > ${f}
for name in ${bps}; do                                                          \
    i=$(($i+1)) &&                                                              \
    echo -n "  {\"actor\": \"${name}\", \"permission\": \"active\"}" >> ${f} && \
    if [ "$i" -ne "21" ]; then echo , >> ${f}; fi                               \
;done
echo >> ${f} && echo ] >> ${f}
cat ${f}


# step 5: create proposal

## Usage: cleos multisig propose_trx [OPTIONS] proposal_name requested_permissions transaction [proposer]
cleos multisig propose_trx updatesysct1 permissions.json eosio.msig.update_tx.json.m   eosstorebest
cleos multisig propose_trx updatesysct2 permissions.json eosio.system.update_tx.json.m eosstorebest
cleos multisig propose_trx updatesysct3 permissions.json eosio.token.update_tx.json.m  eosstorebest
cleos multisig propose_trx updatesysct4 permissions.json eosio.wrap.update_tx.json.m   eosstorebest

```

### review and approve prosposals
``` bash




```



