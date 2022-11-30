// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.7.6;

import "forge-std/Test.sol";

import "src/assetRegistry.sol";
import "src/assetNFT.sol";

contract AssetRegistryTest is Test {
    AssetRegistry registry;
    AssetNFT assets;

    function setUp() public {
        registry = new AssetRegistry();
        assets = new AssetNFT();
    }

    function testMint() public {
    }
}
