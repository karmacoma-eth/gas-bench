// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

struct Params {
    address addr1;
    address addr2;
    uint256 num1;
    uint256 num2;
    string str1;
}

contract RegularArgsDeployee {
    Params public params;

    constructor(
        address addr1,
        address addr2,
        uint256 num1,
        uint256 num2,
        string memory str1
    ) {
        params = Params(addr1, addr2, num1, num2, str1);
    }
}

contract RegularArgsDeployer {
    function deployWithParams(
        address addr1,
        address addr2,
        uint256 num1,
        uint256 num2,
        string calldata str1
    ) public returns (address) {
        return
            address(
                new RegularArgsDeployee{
                    salt: keccak256(abi.encode(addr1, addr2, num1))
                }(addr1, addr2, num1, num2, str1)
            );
    }
}

contract StructArgDeployee {
    Params public params;

    constructor(Params memory params_) {
        params = params_;
    }
}

contract StructArgDeployer {
    function deployWithParams(
        address addr1,
        address addr2,
        uint256 num1,
        uint256 num2,
        string calldata str1
    ) public returns (address) {
        return
            address(
                new StructArgDeployee{
                    salt: keccak256(abi.encode(addr1, addr2, num1))
                }(Params(addr1, addr2, num1, num2, str1))
            );
    }
}

contract ParentGetterDeployee {
    Params public params;

    constructor() {
        (
            address addr1,
            address addr2,
            uint256 num1,
            uint256 num2,
            string memory str1
        ) = ParentGetterDeployer(msg.sender).params();

        params = Params(addr1, addr2, num1, num2, str1);
    }
}

// in the wild: https://github.com/Uniswap/v3-core/blob/main/contracts/UniswapV3PoolDeployer.sol
contract ParentGetterDeployer {
    Params public params;

    function deployWithParams(
        address addr1,
        address addr2,
        uint256 num1,
        uint256 num2,
        string calldata str1
    ) public returns (address deployee) {
        params = Params(addr1, addr2, num1, num2, str1);

        // advantage: the address of the deployee depends only on the address of the factory
        // and the parameters included in the salt
        deployee = address(
            new ParentGetterDeployee{
                salt: keccak256(abi.encode(addr1, addr2, num1))
            }()
        );
        delete params;
    }
}

contract ConstructorArgsTest is Test {
    RegularArgsDeployer regularDeployer = new RegularArgsDeployer();
    StructArgDeployer structDeployer = new StructArgDeployer();
    ParentGetterDeployer parentGetterDeployer = new ParentGetterDeployer();

    function testRegularConstructorArgs() public {
        regularDeployer.deployWithParams(
            address(0x1),
            address(0x2),
            0x3,
            0x4,
            "0x5"
        );
    }

    function testStructConstructorArgs() public {
        structDeployer.deployWithParams(
            address(0x1),
            address(0x2),
            0x3,
            0x4,
            "0x5"
        );
    }

    function testParentGetterConstructorArgs() public {
        parentGetterDeployer.deployWithParams(
            address(0x1),
            address(0x2),
            0x3,
            0x4,
            "0x5"
        );
    }
}
