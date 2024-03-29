// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract OneAddressAtATime {
    function foo(address addr) public view {
        console2.log(addr);
    }
}

contract NormalAddressArrayUnpacker {
    function foo(address[] calldata addresses) public view {
        uint256 length = addresses.length;
        for (uint256 i = 0; i < length; ) {
            console2.log(addresses[i]);

            unchecked {
                i++;
            }
        }
    }
}

contract CompactAddressArrayUnpacker {
    error IllegalArg();

    /// @dev expects a compact array of addresses (20 bytes each, no 0 bytes between them)
    function foo(bytes calldata addresses) public view {
        if (addresses.length % 20 != 0) {
            revert IllegalArg();
        }

        uint256 length = addresses.length / 20;
        for (uint256 i = 0; i < length; ) {
            address addr;

            assembly {
                addr := shr(96, calldataload(add(addresses.offset, mul(i, 20))))
            }

            console2.log(addr);

            unchecked {
                i++;
            }
        }
    }
}

contract AddressArray is Test {
    address[] normal_addresses_01;
    address[] normal_addresses_02;
    address[] normal_addresses_04;
    address[] normal_addresses_08;
    address[] normal_addresses_16;
    address[] normal_addresses_32;
    address[] normal_addresses_64;

    bytes compact_addresses_01;
    bytes compact_addresses_02;
    bytes compact_addresses_04;
    bytes compact_addresses_08;
    bytes compact_addresses_16;
    bytes compact_addresses_32;
    bytes compact_addresses_64;

    NormalAddressArrayUnpacker normal = new NormalAddressArrayUnpacker();

    CompactAddressArrayUnpacker compact = new CompactAddressArrayUnpacker();

    OneAddressAtATime one = new OneAddressAtATime();

    function setUp() public {
        normal_addresses_01.push(makeAddr("1"));
        compact_addresses_01 = abi.encodePacked(makeAddr("1"));

        normal_addresses_02.push(makeAddr("1"));
        normal_addresses_02.push(makeAddr("2"));

        compact_addresses_02 = abi.encodePacked(makeAddr("1"), makeAddr("2"));

        normal_addresses_04.push(makeAddr("1"));
        normal_addresses_04.push(makeAddr("2"));
        normal_addresses_04.push(makeAddr("3"));
        normal_addresses_04.push(makeAddr("4"));

        compact_addresses_04 = abi.encodePacked(
            makeAddr("1"),
            makeAddr("2"),
            makeAddr("3"),
            makeAddr("4")
        );

        for (uint256 i = 0; i < 64; i++) {
            address addr_i = makeAddr(string(abi.encodePacked("addr", i)));

            if (i < 8) {
                normal_addresses_08.push(addr_i);
                compact_addresses_08 = abi.encodePacked(
                    compact_addresses_08,
                    addr_i
                );
            }

            if (i < 16) {
                normal_addresses_16.push(addr_i);
                compact_addresses_16 = abi.encodePacked(
                    compact_addresses_16,
                    addr_i
                );
            }

            if (i < 32) {
                normal_addresses_32.push(addr_i);
                compact_addresses_32 = abi.encodePacked(
                    compact_addresses_32,
                    addr_i
                );
            }

            normal_addresses_64.push(addr_i);
            compact_addresses_64 = abi.encodePacked(
                compact_addresses_64,
                addr_i
            );
        }
    }

    function testNormal_01() public view {
        normal.foo(normal_addresses_01);
    }

    function testCompact_01() public view {
        compact.foo(compact_addresses_01);
    }

    function testNormal_02() public view {
        normal.foo(normal_addresses_02);
    }

    function testCompact_02() public view {
        compact.foo(compact_addresses_02);
    }

    function testNormal_04() public view {
        normal.foo(normal_addresses_04);
    }

    function testCompact_04() public view {
        compact.foo(compact_addresses_04);
    }

    function testNormal_08() public view {
        normal.foo(normal_addresses_08);
    }

    function testCompact_08() public view {
        compact.foo(compact_addresses_08);
    }

    function testNormal_16() public view {
        normal.foo(normal_addresses_16);
    }

    function testCompact_16() public view {
        compact.foo(compact_addresses_16);
    }

    function testNormal_32() public view {
        normal.foo(normal_addresses_32);
    }

    function testCompact_32() public view {
        compact.foo(compact_addresses_32);
    }

    function testNormal_64() public view {
        normal.foo(normal_addresses_64);
    }

    function testCompact_64() public view {
        compact.foo(compact_addresses_64);
    }

    function testNotBatched_01() public view {
        one.foo(normal_addresses_01[0]);
    }

    function testNotBatched_02() public view {
        one.foo(normal_addresses_02[0]);
        one.foo(normal_addresses_02[1]);
    }

    function testNotBatched_04() public view {
        one.foo(normal_addresses_04[0]);
        one.foo(normal_addresses_04[1]);
        one.foo(normal_addresses_04[2]);
        one.foo(normal_addresses_04[3]);
    }

    function testNotBatched_08() public view {
        for (uint256 i = 0; i < 8; ) {
            one.foo(normal_addresses_08[i]);

            unchecked {
                i++;
            }
        }
    }

    function testNotBatched_16() public view {
        for (uint256 i = 0; i < 16; ) {
            one.foo(normal_addresses_16[i]);

            unchecked {
                i++;
            }
        }
    }

    function testNotBatched_32() public view {
        for (uint256 i = 0; i < 32; ) {
            one.foo(normal_addresses_32[i]);

            unchecked {
                i++;
            }
        }
    }

    function testNotBatched_64() public view {
        for (uint256 i = 0; i < 64; ) {
            one.foo(normal_addresses_64[i]);

            unchecked {
                i++;
            }
        }
    }
}
