// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract StringConcat is Test {
    function testStringSingleConcatLength10() public view {
        console2.log(
            string.concat("0", "1", "2", "3", "4", "5", "6", "7", "8", "9")
        );
    }

    function testStringSingleConcatLength20() public view {
        console2.log(
            string.concat(
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9"
            )
        );
    }

    function testStringSingleConcatLength40() public view {
        console2.log(
            string.concat(
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9"
            )
        );
    }

    function testStringSingleConcatLength80() public view {
        console2.log(
            string.concat(
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "0",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9"
            )
        );
    }

    function testStringManyConcat10() public view {
        string memory buf;
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        console2.log(buf);
    }

    function testStringManyConcat20() public view {
        string memory buf;
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        console2.log(buf);
    }

    function testStringManyConcat40() public view {
        string memory buf;
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        console2.log(buf);
    }

    function testStringManyConcat80() public view {
        string memory buf;
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        buf = string.concat(buf, "0");
        buf = string.concat(buf, "1");
        buf = string.concat(buf, "2");
        buf = string.concat(buf, "3");
        buf = string.concat(buf, "4");
        buf = string.concat(buf, "5");
        buf = string.concat(buf, "6");
        buf = string.concat(buf, "7");
        buf = string.concat(buf, "8");
        buf = string.concat(buf, "9");
        console2.log(buf);
    }
}
