//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Cat is ERC721URIStorage,Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
   
    
    constructor() ERC721("CAT NFT", "CAT")  {
        
    }

    function purchase() payable public {
        uint256 price=0.001 ether;
        require(msg.value>=price);
        _tokenIds.increment();
        require(_tokenIds.current()<=2);
        uint256 newItemId = _tokenIds.current();
        payable(owner()).transfer(msg.value);
        _mint(msg.sender, newItemId);       
    }
    function _baseURI() internal pure override returns (string memory)  {
        return 'https://catnftproject.herokuapp.com';
    }    
}