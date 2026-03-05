// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // this is the solidity version

contract SimpleStorage {
    // Basic types: boolean, uint ( unsigned integer ), int (signed whole number), address, bytes
    // bool hasFavoriteNumber = true;
    // uint favoriteNumber = 88;
    // uint256 favoriteNumber1 = 88; // 256 bits and default is also uint256
    // int256 anotherFavoriteNumber = 12;
    // string favoriteNumberInText = "88";
    // address myAddress = 
    // bytes32 favoriteBytes32 = "cat"; // bytes32 and bytes are not same , under the hood string is working
    // using bytes

    // uint256 favoriteNumber = 5;
    // default visibility is internal
    // uint256 internal favoriteNumber;
    // uint256 public favoriteNumber; // by default 0
    uint256 myFavoriteNumber; // by default 0
    // writing public for a number is similar to making a getter function for a variable

    // uint256[] listOfFavoriteNumbers;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // the below is the dynamic array
    Person[] public listOfPeople; 

    // chelesa => 232
    mapping(string => uint256) public nameToFavoriteNumber;
    // Person[10] public listOfPeople; // list of 10 elements

    // Person public myFriend = Person(7, "Kapil");
    // Person public kapil = Person({
    //     favoriteNumber: 7,
    //     name: "Kapil"
    // });

    // Person public mariah = Person({
    //     favoriteNumber: 10,
    //     name: "Mariah"
    // });

    // Person public john = Person({
    //     favoriteNumber: 10,
    //     name: "John"
    // });



    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
        // favoriteNumber = favoriteNumber + 1;

    }
    // functions marked with view or pure are only reading the blockchain state
    // pure function is that its return value never changes
    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }

    // evm can read and write to stack, memory, storage, calldata
    // by default variables are stored in memory
    // for specifically strings we need to specify calldata or memory and it shows that the variables
    // are temporary variables
    // memory data is mutable and calldata variable is not mutable and storage are permanent variables
    // that can be modified.
    // if we create variable outside the function then it is implicitly stored as storage variable
    // we need to specify this for array, struct or mapping types 
    // we can't specify storage for function parameters because solidity knows that it is a temporary
    // variables
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person({
            name: _name,
            favoriteNumber: _favoriteNumber
        }));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }


}