// SPDX-License-Identifier: AGPL-3.0-only
// Copyright (C) 2017, 2018, 2019 dbrock, rain, mrchico
pragma solidity ^0.8.0;

import "tinlake-auth/auth.sol";

interface AssetNFT {
  function mintTo(address usr) external returns(uint);
}

contract AssetRegistry is Auth {

  AssetNFT assets;

function depend(bytes32 contractName, address addr) external auth {
    if (contractName == "assets") assets = AssetNFT(addr);
    else revert();
}

function mint(address _to) public auth {
assets.mintTo(_to);
}
  
}
