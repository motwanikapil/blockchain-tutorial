// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { SimpleStorage } from './SimpleStorage.sol';

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;
    // address[] public listOfSimpleStorageAddresses;

    function createSimpleStorageContract() public {
        // how does the storage factory know what simple storage looks like
        SimpleStorage simpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // Address
        // ABI ( Application Binary Interface ) ( technically a lie, you just need the function selector )
        // SimpleStorage(address)
        // SimpleStorage simpleStorage = SimpleStorage(listOfSimpleStorageAddresses[_simpleStorageIndex]);

        SimpleStorage simpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        simpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage simpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return simpleStorage.retrieve();
    }
}