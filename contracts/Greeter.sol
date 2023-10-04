// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

/**
 ▄    ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄ 
▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
▐░▌ ▐░▌ ▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌ ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌ ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌
▐░▌▐░▌  ▐░▌       ▐░▌▐░▌▐░▌    ▐░▌     ▐░▌     ▐░▌       ▐░▌▐░▌       ▐░▌     ▐░▌     ▐░▌       ▐░▌
▐░▌░▌   ▐░▌       ▐░▌▐░▌ ▐░▌   ▐░▌     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌
▐░░▌    ▐░▌       ▐░▌▐░▌  ▐░▌  ▐░▌     ▐░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░▌     ▐░░░░░░░░░░░▌
▐░▌░▌   ▐░▌       ▐░▌▐░▌   ▐░▌ ▐░▌     ▐░▌     ▐░█▀▀▀▀█░█▀▀ ▐░█▀▀▀▀▀▀▀█░▌     ▐░▌     ▐░█▀▀▀▀▀▀▀█░▌
▐░▌▐░▌  ▐░▌       ▐░▌▐░▌    ▐░▌▐░▌     ▐░▌     ▐░▌     ▐░▌  ▐░▌       ▐░▌     ▐░▌     ▐░▌       ▐░▌
▐░▌ ▐░▌ ▐░█▄▄▄▄▄▄▄█░▌▐░▌     ▐░▐░▌     ▐░▌     ▐░▌      ▐░▌ ▐░▌       ▐░▌     ▐░▌     ▐░▌       ▐░▌
▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░▌      ▐░░▌     ▐░▌     ▐░▌       ▐░▌▐░▌       ▐░▌     ▐░▌     ▐░▌       ▐░▌
 ▀    ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀        ▀▀       ▀       ▀         ▀  ▀         ▀       ▀       ▀         ▀    

 @author Nuxify Inc.
 @notice Simple greeter contract
 @dev Uses hardhat console for debugging and demo purposes                                                                                                                                                                                                                          
*/

import "hardhat/console.sol";

contract Greeter {
    string private greeting;

    constructor(string memory _greeting) {
        console.log("Deploying a Greeter with greeting:", _greeting);
        greeting = _greeting;
    }

    event LogSetGreeting(string greeting, uint256 timestamp);

    /// @notice Sets the greeting
    /// @dev Emits an event with the new greeting and timestamp
    /// @param _greeting new greeting message
    function setGreeting(string calldata _greeting) external {
        console.log("Changing greeting from '%s' to '%s'", greeting, _greeting);
        greeting = _greeting;

        emit LogSetGreeting(_greeting, block.timestamp);
    }

    /// @notice Get latest greeting
    /// @return string latest greeting message
    function greet() public view returns (string memory) {
        return greeting;
    }

    /// Helper Functions

    /// @dev Etherscan trick when verifying and etherscan returns error. Increment the build number every deployment.
    /// @dev Completely optional.
    function _delBuildNumber1() internal pure {}
}
