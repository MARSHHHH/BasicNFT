//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenURIs;

    constructor() ERC721("BasicNft", "BNFT") {
        //Every time we update the new BNFT we will increment the token counter
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenuri) public {
        s_tokenURIs[s_tokenCounter] = tokenuri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenURIs[tokenId];
    }
}
