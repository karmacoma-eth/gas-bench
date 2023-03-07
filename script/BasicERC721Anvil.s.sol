// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {BasicERC721} from "src/BasicERC721.sol";

contract BasicERC721Script is Script {
    string internal constant ANVIL_MNEMONIC = "test test test test test test test test test test test junk";

    function run() public {
        string memory mnemonic = vm.envOr("MNEMONIC", ANVIL_MNEMONIC);
        uint256 deployerPK = vm.deriveKey(mnemonic, uint32(0));
        address deployer = vm.addr(deployerPK);
        console2.log("deployer address:", deployer);

        vm.broadcast(deployerPK);
        BasicERC721 nftContract = new BasicERC721();
        console2.log("nftContract address:", address(nftContract));

        uint256 alicePK = vm.deriveKey(mnemonic, uint32(1));
        vm.broadcast(alicePK);
        nftContract.mint(); // gas used: 73229

        uint256 bobPK = vm.deriveKey(mnemonic, uint32(2));
        vm.broadcast(bobPK);
        nftContract.mint(); // gas used: 73229
    }
}
