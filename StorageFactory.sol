// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { SimpleStorage } from './SimpleStorage.sol';

contract StorageFactory {
    SimpleStorage public simpleStorage;
    function createSimpleStorageContract() public {
        // how does the storage factory know what simple storage looks like
        simpleStorage = new SimpleStorage();
    }
}