// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {BasicERC721} from "src/BasicERC721.sol";

contract BasicERC721Script is Script {
    function run() public {
        uint256 deployerPK = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPK);
        console2.log("deployer address:", deployer);

        vm.broadcast(deployerPK);
        BasicERC721 nftContract = new BasicERC721();
        // BasicERC721 nftContract = BasicERC721(0x9ea7EDd6674557C357bC41447D38306EeA1e08e0);
        console2.log("nftContract address:", address(nftContract));

        (address alice, uint256 alicePK) = makeAddrAndKey("alice-basic-erc721");
        console2.log("alice:", alice);
        vm.broadcast(alicePK);
        nftContract.mint();

        (address bob, uint256 bobPK) = makeAddrAndKey("bob-basic-erc721");
        console2.log("bob:", bob);
        vm.broadcast(bobPK);
        nftContract.mint();
    }
}
