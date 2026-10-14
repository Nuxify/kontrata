// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.37;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Counter} from "../src/Counter.sol";

contract DeployCounterScript is Script {
    function run() public {
        // get network from .env
        string memory network = vm.envString("NETWORK_ENV");

        console.log("==========================================");
        console.log("Deploying Counter to:", network);
        console.log("==========================================");

        // Build prefix for environment variables
        string memory prefix = string(abi.encodePacked(network, "_"));

        // Get RPC URL and private key from environment
        string memory rpcUrl = vm.envString(string(abi.encodePacked(prefix, "RPC_URL")));

        console.log("RPC URL:", rpcUrl);
        console.log("==========================================");

        // setup constructor
        address initialOwner = _getEnvAddress(prefix, "OWNER_ADDRESS");

        console.log("Configuration:");
        console.log("Owner:", initialOwner);
        console.log("==========================================");

        // deploy
        vm.startBroadcast();
        Counter counter = new Counter();
        vm.stopBroadcast();

        // Log deployment details
        console.log("Counter deployed at:", address(counter));
        console.log("Network:", network);
    }

    function _getEnvAddress(string memory prefix, string memory varName) internal view returns (address) {
        string memory fullVar = string(abi.encodePacked(prefix, varName));
        return vm.envAddress(fullVar);
    }
}
