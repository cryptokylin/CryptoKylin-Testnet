
### boot sequence

```
# step 1: prepare config.ini and genesis.json

# step 2: run nodeos
su eosio
nodeos --config-dir /data/eos-config -d /data/eos-data  --genesis-json /data/eos-config/genesis.json

# step 3: prepare wallet
cleos wallet create
cleos wallet import <eosio-private-key>

# step 4: set contract eosio.bios
CONTRACTS_FOLDER='/opt/EOS-Mainnet/eos/build/contracts'
cleos set contract eosio ${CONTRACTS_FOLDER}/eosio.bios -p eosio

# step 5: create system accounts
for account in eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee eosio.saving eosio.stake eosio.token eosio.vpay
do
  echo -e "\n creating $account \n";
  cleos create account eosio ${account} EOS7hHHDtnPRbhMmfHJHUEKQyiutKrt9wZPdy1JbaATVLyxpCkrop;
  sleep 1;
done

# step 6: set contract
cleos set contract eosio.token ${CONTRACTS_FOLDER}/eosio.token -p eosio.token
cleos set contract eosio.msig ${CONTRACTS_FOLDER}/eosio.msig -p eosio.msig

# step 7: create and issue token
cleos push action eosio.token create '["eosio", "10000000000.0000 EOS"]' -p eosio.token
cleos push action eosio.token issue '["eosio",  "1000000000.0000 EOS", "cryptokylin"]' -p eosio

# step 8: set contract eosio.system
cleos set contract eosio ${CONTRACTS_FOLDER}/eosio.system -x 1000 -p eosio

# step 9: create some account
cleos system newaccount --stake-net "10.0000 EOS" --stake-cpu "10.0000 EOS" --buy-ram "10.0000 EOS"  eosio eosecoeoseco EOS73Th1ph7AHJz93zEmbmqNnkVkNqSuy9e3sGQRaLwxUEHJQdmB3 EOS73Th1ph7AHJz93zEmbmqNnkVkNqSuy9e3sGQRaLwxUEHJQdmB3
cleos system newaccount --stake-net "10.0000 EOS" --stake-cpu "10.0000 EOS" --buy-ram "10.0000 EOS"  eosio eosbixincool EOS89A2Zktdyb3iij4aejoWLwhHjWuZjsVBGqNCwybEcfV2F2pYpR EOS6eMWsyR9ZcrT9rpRd5dzkyWnNKzs3SxzvjjkaedREwcVf1dBbx
cleos system newaccount --stake-net "10.0000 EOS" --stake-cpu "10.0000 EOS" --buy-ram "10.0000 EOS"  eosio eospaceioeos EOS8LjRfkatmLxKdJiBXjyFAnFqws1gkjoWDv7xwf87WfGpBs7Z8Y EOS6vxCWyx3ryiFosCTQ6eWDdcEPvp6ebBi5CWnbz4y4ifR6GcMft
cleos system newaccount --stake-net "10.0000 EOS" --stake-cpu "10.0000 EOS" --buy-ram "10.0000 EOS"  eosio eosasia11111 EOS5a5qPLuRqJgbCv1xvLUpKst4NVnhWL3kLaPQ4MeBC1GVr2ikb8 EOS5a5qPLuRqJgbCv1xvLUpKst4NVnhWL3kLaPQ4MeBC1GVr2ikb8
cleos system newaccount --stake-net "10.0000 EOS" --stake-cpu "10.0000 EOS" --buy-ram "10.0000 EOS"  eosio eosstorebest EOS5F3xZaNRhDLzKRGgu5npxKQdFNBTeoSVhdyNz8WFiVXAoCmTcW EOS6GkvvJNM43iN61a4qZjLtm41c6KSW3ggJYpt8Q7CWfCyqBZ7Je
cleos system newaccount --stake-net "10.0000 EOS" --stake-cpu "10.0000 EOS" --buy-ram "10.0000 EOS"  eosio eoslaomaocom EOS8hNCsEiEQzYiZY8uVxJiWGqD38VoDUNuVfS648spsftAJA87Z1 EOS8hNCsEiEQzYiZY8uVxJiWGqD38VoDUNuVfS648spsftAJA87Z1
cleos system newaccount --stake-net "10.0000 EOS" --stake-cpu "10.0000 EOS" --buy-ram "10.0000 EOS"  eosio eoshuobipool EOS4xfwXh5DmXWdCJv3HFm7cnCYUGabE3itoabZBYwedNDKwA2YQU EOS4vRtWyVQezZG5tjXYNJigaaxx17ym5vR21cBG2mAuKJWBGHU1S

# --  faucet accounts -- 
cleos system newaccount --stake-net "10.0000 EOS" --stake-cpu "10.0000 EOS" --buy-ram "10.0000 EOS"  eosio eosfaucet111 EOS8CjwFmPtGzhZEST7NTSNfoAULHTVHfrBdVJQxeSD2b3XMFHbZs EOS8TRdivFvDSVZcVPHoyMPrSmn2BajKZYoAt9af37RcWDGkntz1c
cleos system newaccount --stake-net "10.0000 EOS" --stake-cpu "10.0000 EOS" --buy-ram "10.0000 EOS"  eosio eosio.faucet EOS6ZdSYBZtvZ9E3KKBbgMo75Tj787H6Cn5F5QvEGZ9A7GJzFkK6n EOS6fqxxdiuvRR8y6LdfAjKoPLVuVuHHz2wHoTqB3mVBhQQqgonef

# step 10: transfer
cleos  transfer  eosio  eosecoeoseco  "100000000.0000 EOS"
cleos  transfer  eosio  eosbixincool  "100000000.0000 EOS"
cleos  transfer  eosio  eospaceioeos  "100000000.0000 EOS"
cleos  transfer  eosio  eosasia11111  "100000000.0000 EOS"
cleos  transfer  eosio  eosstorebest  "100000000.0000 EOS"
cleos  transfer  eosio  eoslaomaocom  "100000000.0000 EOS"
cleos  transfer  eosio  eoshuobipool  "100000000.0000 EOS"


# step 11: transfer all eosio balance to faucet account and activate the network
cleos  transfer  eosio  eosfaucet111  "100000000.0000 EOS"
cleos  transfer  eosio  eosio.faucet  "199999730.0000 EOS"

## check eosio balance
cleos get currency balance eosio.token eosio


# step last: resign all system account
for account in eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee eosio.saving eosio.stake eosio.token eosio.vpay
do
  cleos push action eosio updateauth '{"account": "'$account'", "permission": "active", "parent": "owner", "auth":{"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": active}}]}}' -p ${account}@active
  cleos push action eosio updateauth '{"account": "'$account'", "permission": "owner", "parent": "",       "auth":{"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": active}}]}}' -p ${account}@owner
  sleep 1;
done

## check system accounts
for account in eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee eosio.saving eosio.stake eosio.token eosio.vpay
do
  echo --- ${account} --- && cleos get account ${account} && sleep 1;
done

cleos push action eosio updateauth '{"account": "eosio", "permission": "active", "parent": "owner", "auth":{"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio.prods", "permission": active}}]}}' -p eosio@active
cleos push action eosio updateauth '{"account": "eosio", "permission": "owner", "parent": "",       "auth":{"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio.prods", "permission": active}}]}}' -p eosio@owner

## check eosio
cleos get account eosio
```
