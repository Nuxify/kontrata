# Kontrata Solidity Template

## Documentation

https://book.getfoundry.sh/

https://github.com/dabit3/foundry-cheatsheet

https://github.com/dabit3/foundry-workshop

## Usage

### Install

```shell
forge install
# includes forge-std and openzeppelin-contracts

# if you need to delete .git after cloning because of outer git tracking, need to execute the ff:
rm -rf .git
rm -rf .gitmodules lib/forge-std lib/openzeppelin-contracts
forge install foundry-rs/forge-std
forge install OpenZeppelin/openzeppelin-contracts
# then you can safely run `forge install` again if needed
```

## Build

```shell
$ forge build
```

### Test

```shell
$ forge test -vvvv

$ forge test --gas-report
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ source .env

$ forge script script/Counter.s.sol:DeployCounterScript --rpc-url $LOCAL_RPC_URL --private-key $LOCAL_PRIVATE_KEY --broadcast
or
$ forge script script/Counter.s.sol:DeployCounterScript --rpc-url $TESTNET_RPC_URL --private-key $TESTNET_PRIVATE_KEY --broadcast
or
$ forge script script/Counter.s.sol:DeployCounterScript --rpc-url $MAINNET_RPC_URL --private-key $MAINNET_PRIVATE_KEY --broadcast
```

### Cast

```shell
$ cast call $CONTRACT_ADDRESS "number()(uint256)" --rpc-url $LOCAL_RPC_URL
$ cast send $CONTRACT_ADDRESS "increment()" --rpc-url $LOCAL_RPC_URL --private-key $LOCAL_PRIVATE_KEY
$ cast send $CONTRACT_ADDRESS "setNumber(uint256)" 100 --rpc-url $LOCAL_RPC_URL --private-key $LOCAL_PRIVATE_KEY
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
