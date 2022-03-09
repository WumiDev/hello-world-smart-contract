// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract HelloWorldSmartContract {
    string public greetings;

    constructor(string memory _hello) {
       greetings = _hello;
    }

    //create a function that reads the greeting from the smart contract
    function getGreetings() public view returns(string memory) {
       return greetings;
    }

    //create a function that writes a greeting to the smart contract
    function setGreetings(string memory _greetings) public {
             greetings = _greetings;
    }
}