# tinlake-asset-nft

## Deploy 

### Asset NFT
```bash
forge create --rpc-url $RPC_URL --private-key $PRIVATE_KEY src/assetNFT.sol:AssetNFT --verify --etherscan-api-key $ETHERSCAN_KEY
```

### Asset Registry
```bash
forge create --rpc-url $RPC_URL --private-key $PRIVATE_KEY src/assetRegistry.sol:AssetRegistry --verify --etherscan-api-key $ETHERSCAN_KEY
```
