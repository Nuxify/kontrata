//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.15;

/*
                 w                     8      8              
8d8b.d8b. .d88b w8ww .d88 88b. .d88 .d88   .d88 .d88b Yb  dP 
8P Y8P Y8 8.dP'  8   8  8 8  8 8  8 8  8   8  8 8.dP'  YbdP  
8   8   8 `Y88P  Y8P `Y88 88P' `Y88 `Y88 w `Y88 `Y88P   YP   
                          8                                     
*/

import "hardhat/console.sol";

contract Greeter {
    string private greeting;

    constructor(string memory _greeting) {
        console.log("Deploying a Greeter with greeting:", _greeting);
        greeting = _greeting;
    }

    function setGreeting(string memory _greeting) public {
        console.log("Changing greeting from '%s' to '%s'", greeting, _greeting);
        greeting = _greeting;
    }

    function greet() public view returns (string memory) {
        return greeting;
    }
}
