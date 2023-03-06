// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {Test} from "forge-std/Test.sol";

import {BasicERC721} from "src/BasicERC721.sol";

contract BasicERC721Test is Test {
    BasicERC721 nftContract;

    address private alice = makeAddr("alice");
    address private bob = makeAddr("bob");

    function setUp() public {
        nftContract = new BasicERC721();

        // alice starts with a token
        vm.prank(alice);
        nftContract.mint();
    }

    function mint(uint256 n) private {
        unchecked {
            for (uint160 i = 0; i < n; i++) {
                address recipient = address(uint160(bob) + i);
                vm.prank(recipient);
                nftContract.mint();
            }
        }
    }

    function test_mint_newcomer_0001() public {
        vm.prank(bob);
        nftContract.mint();
    }

    function test_mint_newcomer_0010() public {
        mint(10);
    }

    function test_mint_newcomer_0100() public {
        mint(100);
    }

    function test_mint_newcomer_1000() public {
        mint(1000);
    }

    function test_mint_existing() public {
        vm.prank(alice);
        nftContract.mint();
    }

    function test_transferFrom() public {
        vm.prank(alice);
        nftContract.transferFrom(alice, bob, 1);
    }

    function test_balanceOf() public {
        nftContract.balanceOf(alice);
    }

    function test_ownerOf() public {
        nftContract.ownerOf(1);
    }
}
