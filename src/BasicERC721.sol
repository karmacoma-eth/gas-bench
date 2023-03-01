// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract BasicERC721 is ERC721 {
    uint256 nextTokenId = 1;

    constructor() ERC721("basic", unicode"✌️") {}

    function mint() external {
        _mint(msg.sender, nextTokenId);

        unchecked {
            nextTokenId++;
        }
    }
}
