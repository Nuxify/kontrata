# Kontrata

EVM-based smart contract development template using Solidity and Hardhat (and Remix IDE)

## Local Development

```bash
# clean and compile contract and hardhat
$ npm run compile

# check test accounts
$ npm run accounts

# test contract with option to report gas
# IMPORTANT: don't forget to start Ganache or other local ethereum chain
$ npm run test
$ npm run test:gas

# run linter with option to fix
$ npm run lint
$ npm run lint:fix
```

## Deployment

```bash
# deploy to contract to network
$ npm run deploy_<contract>:<network>
$ npm run deploy_greeter:ganache ...(example)
$ npm run deploy_greeter:rinkeby ...(example)
```

## Verification

When verifying with block explorers, uncomment the ff code snippet from `scripts/deploy_*.ts`

```bash
// verify in contract in explorer (etherscan, etc.)
await sleep(1000)
console.log("Verifying Greeter contract ...")
await hre.run("verify:verify", {
    address: greeter.address,
    constructorArguments: ["Hello, Hardhat!"], // provide if necessary
})
```

For detailed explanation on how hardhat works, check out [Hardhat docs](https://hardhat.org/getting-started).

Made with ❤️ at [Nuxify](https://nuxify.tech)

Proudly used by [Metapad](https://metapad.dev)
