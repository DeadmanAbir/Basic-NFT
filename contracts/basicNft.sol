// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

pragma solidity >0.8.7;

contract basicNFT is ERC721{

    // State Variables
    uint256 private tokenCounter=0;
    string public constant TOKEN_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    constructor() ERC721("Cheems", "Dogesh"){
        tokenCounter=0;
    }

    function mintNFT() public returns(uint256){
        _mint(msg.sender, tokenCounter);
        tokenCounter++;
        return tokenCounter;
    }

    function tokenURI(uint256) public view override returns(string memory){
        return TOKEN_URI;
    }

    function getTokenCounter() public view returns(uint256){
        return tokenCounter;
    }
}