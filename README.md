# Kontrata Solidity Template

## Documentation

https://book.getfoundry.sh/

https://github.com/dabit3/foundry-cheatsheet

https://github.com/dabit3/foundry-workshop

## Usage

### Install

```shell
forge install OpenZeppelin/openzeppelin-contracts
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
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
