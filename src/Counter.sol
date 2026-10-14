// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.37;

/// @title Counter
/// @author Nuxify Inc.
/// @notice A simple counter contract
contract Counter {
    uint256 public number;

    /// @notice Set number
    /// @param _number The new number to set
    function setNumber(uint256 _number) external {
        number = _number;
    }

    /// @notice Increment number
    function increment() external {
        number++;
    }
}
