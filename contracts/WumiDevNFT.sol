//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.4;

contract WumiDevNFT is ERC721, Ownable {

    string _baseTokenURI;
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor(string memory baseURI) ERC721("WumiDevNFT", "WDNFT") {
        _baseTokenURI = baseURI;
    }

    //   @dev _baseURI overides the Openzeppelin's ERC721 implementation which by default
    // * returned an empty string for the baseURI 
      function _baseURI() internal view virtual override returns (string memory) {
          return _baseTokenURI;
      }


    function mintNFT(address receiver) public onlyOwner returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(receiver, newItemId);
        // _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}