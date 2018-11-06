
##  How to update and approve eosio.contracts on Kylin Testnet 
In order to verify the [eosio.contracts]((https://github.com/EOSIO/eosio.contracts) )'s function and security before updating them on EOS mainnet,
After a new version released, we need to deploy the new contracts to the Kylin testnet for testing.

Note: Automatically generated ABI files are generally incomplete and require manual modification to work properly. 
You can refer to it [github.com/cryptokylin/eosio.contracts](https://github.com/cryptokylin/eosio.contracts)'s
branch [v1.4.0-fixed](https://github.com/cryptokylin/eosio.contracts/tree/v1.4.0-fixed), which complements the missing content in the ABI files.


### Steps for propose update proposals
``` bash
# step 1: build eosio.contracts and check generated *.abi files.
git clone https://github.com/cryptokylin/eosio.contracts
cd eosio.contracts && git checkout v1.4.0-fixed
./build.sh

# step 2: generate transaction json files
home_dir=`cd && pwd`
tmp_dir="${home_dir}/tmp/eosio.contracts.v1.4.0"
mkdir -p ${tmp_dir} && cd ${tmp_dir}
repo_dir=<your eosio.contracts repo absolute directory>  # such as repo_dir='/Code/github.com/cryptokylin/eosio.contracts'
build_dir=${repo_dir}/build
alias cleos='cleos -u http://kylin.fn.eosbixin.com' 
for c in token msig system wrap; do \
cleos set contract eosio ${build_dir}/eosio.${c} -j -d -s > eosio.${c}.update_tx.json; done

# step 3: modify these json files.
expiration="2018-11-10T12:00:00"        # you can set this time to three or ten days later as you want.
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

# step 5: create proposals
cleos multisig propose_trx updatesysct1 permissions.json eosio.msig.update_tx.json.m   eosstorebest
cleos multisig propose_trx updatesysct2 permissions.json eosio.system.update_tx.json.m eosstorebest
cleos multisig propose_trx updatesysct3 permissions.json eosio.token.update_tx.json.m  eosstorebest
cleos multisig propose_trx updatesysct4 permissions.json eosio.wrap.update_tx.json.m   eosstorebest
```

### Send the following message to top 21 bps.

Hi Top 21 BPs, https://github.com/EOSIO/eosio.contracts released a new version of v1.4.0 . 
I compiled the contracts and proposed several update proposals.

You can check the source code at https://github.com/cryptokylin/eosio.contracts/tree/v1.4.0-fixed ,
here I just complete these ABI files and without any other modification.

You can use the following commands to see the contents of the proposals.
 
alias cleos='cleos -u http://kylin.fn.eosbixin.com' 
cleos multisig review eosstorebest updatesysct1
cleos multisig review eosstorebest updatesysct2
cleos multisig review eosstorebest updatesysct3
cleos multisig review eosstorebest updatesysct4

You can check the approved status by following cmds.
To get proposal updatesysct1's status:
cleos get table eosio.msig eosstorebest approvals | jq '.rows[]|select(.proposal_name=="updatesysct1")'

If you confirm it, you can pass the validation.
I set "expiration": "2018-11-10T12:00:00" in every proposal, so if it's ok, approve it before that time please.

cleos multisig approve eosstorebest updatesysct1 '{"<your-bp-name>":"active"}' -p <your-bp-name>

and other proposals: updatesysct2 updatesysct3 updatesysct4;

(the Kylin Testnet's current system contracts version is v1.3.1)


### Execute proposal when get enough approves.
``` bash
cleos multisig exec eosstorebest updatesysct1 -p eosstorebest
## and other proposals: updatesysct2 updatesysct3 updatesysct4;
```
