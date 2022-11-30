// SPDX-License-Identifier: AGPL-3.0-only
// Copyright (C) 2017, 2018, 2019 dbrock, rain, mrchico
pragma solidity ^0.8.0;

import "tinlake-auth/auth.sol";

interface IAssetNFT {
  function mintTo(address usr) external returns(uint);
}

contract AssetRegistry is Auth {

  IAssetNFT assets;

  event Rely(address indexed usr);

constructor() {
    wards[msg.sender] = 1;
    emit Rely(msg.sender);
}

function depend(bytes32 contractName, address addr) external auth {
    if (contractName == "assetNFT") assets = IAssetNFT(addr);
    else revert();
}

function mint(address _to) public auth {
    assets.mintTo(_to);
} 
}
