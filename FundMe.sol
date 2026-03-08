// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts@1.5.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 5e18;

    function fund() public payable {
        require(getConversionRate(msg.value) >= minimumUsd, "didn't send enough eth");
    }

    function getPrice() public view returns(uint256){
        // address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // abi 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // (uint80 roundId, int256 price, uint256 startedAt, uint256 timestamp, uint256 answeredInRound) =  priceFeed.latestRoundData();
        (,int256 price,,,) =  priceFeed.latestRoundData();
        // price of eth in term of usd
        return uint256(price * 1e10); // because to format the price correctly
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}