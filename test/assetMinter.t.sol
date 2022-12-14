// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.7.6;

import "forge-std/Test.sol";

import "src/assetMinter.sol";
import "src/assetNFT.sol";

contract AssetMinterTest is Test {
    AssetMinter minter;
    AssetNFT assets;

    function setUp() public {
        minter = new AssetMinter();
        assets = new AssetNFT();

        assert(assets.wards(address(this)) == 1);
        assert(minter.wards(address(this)) == 1);
    }

    function testMint() public {
        assets.rely(address(minter));
        minter.depend("assetNFT", address(assets));
        minter.mintTo(address(this));
    }

    function testMintWithoutRelyFails() public {
        minter.depend("assetNFT", address(assets));
        vm.expectRevert("not-authorized");
        minter.mintTo(address(this));
    }

    function testMintWithoutDependFails() public {
        assets.rely(address(minter));
        vm.expectRevert("asset-nft-not-set");
        minter.mintTo(address(this));
    }

    function testMintWithoutRelyAndDependFails() public {
        vm.expectRevert("asset-nft-not-set");
        minter.mintTo(address(this));
    }
}
