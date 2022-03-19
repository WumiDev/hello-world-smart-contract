//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WumiDevToken is ERC20, Ownable {
    event Received(address, uint);

    uint256 tokensOneEthCanBuy = 1000;

    constructor() ERC20("WumiDevToken", "WDT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());        
    }   
   
    function buyToken(address receiver) public payable {
        require(msg.value > 0, "You need a minimum of 0.001 Eth");
        uint amount = msg.value * tokensOneEthCanBuy;
        _mint(receiver, amount);
    }

    // Function to receive Ether. msg.data must be empty
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // Fallback function is called when msg.data is not empty
    fallback() external payable {
         emit Received(msg.sender, msg.value);
    }
}