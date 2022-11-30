pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "tinlake-auth/auth.sol";

contract AssetNFT is ERC721, Auth {
    uint public count = 0;

    constructor() ERC721("Tinlake Asset NFT", "TNLK") {
    }

    function mintTo(address usr) public auth returns(uint) {
        count++;
        _safeMint(usr, count); 
        return count;
    }
}