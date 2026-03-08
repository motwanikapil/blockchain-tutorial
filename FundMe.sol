// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe {
    // uint256 public myValue = 1;
    uint256 public minimumUsd = 5;
    function fund() public payable {
        // msg.value is a global in solidity smart contract
        // myValue = myValue + 2;
        // require(msg.value > 1e18, "didn't send enough eth");
        require(msg.value >= minimumUsd, "didn't send enough eth");

        // what is a revert?
        // undo any actions that have been done, and send the remaining gas back
    }

    // function withdraw() public {}
}