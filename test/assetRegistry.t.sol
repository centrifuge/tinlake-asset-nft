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
        
        assert(assets.wards(address(this)) == 1);
        assert(registry.wards(address(this)) == 1);
    }

    function testMint() public {
        assets.rely(address(registry));
        registry.depend("assetNFT", address(assets));
        registry.mint(address(this));
    }
}
