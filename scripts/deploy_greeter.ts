import hre from "hardhat"
// eslint-disable-next-line node/no-extraneous-require
const fs = require("fs-extra")

async function main() {
  // remove caches and recompile
  fs.removeSync("cache")
  fs.removeSync("artifacts")
  await hre.run("compile")

  // deployer info
  const [deployer] = await hre.ethers.getSigners()
  const deployerAddress = await deployer.getAddress()
  const account = await hre.ethers.utils.getAddress(deployerAddress)
  const balance = await deployer.getBalance()

  const network = process.env.NETWORK ? process.env.NETWORK : "sepolia"

  console.log(`>>> Network is set to ${network}`)
  console.log(`Deployer account: ${account}`)
  console.log(`Balance: ${hre.ethers.utils.formatEther(balance)} ETH`)

  // get and deploy contract
  const Greeter = await hre.ethers.getContractFactory("Greeter")
  console.log("Deploying Greeter contract ...")
  const deployed = await Greeter.deploy(
    "Kontrata Smart Contracts Template from Nuxify"
  )
  const contract = await deployed.deployed()
  console.log(`Deployed Greeter contract to: ${contract.address}`)

  // verify in contract in explorer (etherscan, etc.)
  await sleep(15000) // some networks require it higher to prevent errors
  console.log("Verifying Greeter contract ...")
  await hre
    .run("verify:verify", {
      address: contract.address,
      constructorArguments: ["Kontrata Smart Contracts Template from Nuxify"],
    })
    .catch((err) => {
      console.error("Etherscan verify error:", err)
    })

  console.log("=========================================")
  console.log("Greeter deployed to:", contract.address)
}

/// helper functions
function sleep(ms: number) {
  return new Promise((resolve) => {
    setTimeout(resolve, ms)
  })
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error)
  process.exitCode = 1
})
