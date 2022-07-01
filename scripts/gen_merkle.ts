import hre from "hardhat"
import { MerkleTree } from "merkletreejs"
import keccak256 from "keccak256"
const fs = require("fs-extra")
const whitelistAddresses: string[] = require("./whitelist_addresses.json")

interface ProofInterface {
  address: string
  proof: string[]
}

let merkleTree: MerkleTree

async function main() {
  fs.removeSync("scripts/whitelist_proof.json") // cleanup output file

  // initialize merkle tree
  let leaves = whitelistAddresses.map((whitelistAddress: string) =>
    hashToken(whitelistAddress)
  )

  merkleTree = new MerkleTree(leaves, keccak256, {
    sortPairs: true,
    hashLeaves: false,
  })

  let data: ProofInterface[] = []
  whitelistAddresses.forEach((whitelistAddress) => {
    const proof = merkleTree.getHexProof(hashToken(whitelistAddress))
    console.log(`WL address: ${whitelistAddress}, proof: ${proof}`)
    data.push({ address: whitelistAddress, proof: proof })
  })

  let output = JSON.stringify(data)
  fs.writeFileSync("scripts/whitelist_proof.json", output)

  console.log("Total accounts processed = ", merkleTree.getLeaves().length)
  console.log("---------------------------------------------")
  console.log("Merkle Root :", merkleTree.getHexRoot())
}

function hashToken(address: string) {
  return Buffer.from(
    hre.ethers.utils.solidityKeccak256(["address"], [address]).slice(2), // hash and remove "0x"
    "hex"
  )
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error)
  process.exitCode = 1
})
