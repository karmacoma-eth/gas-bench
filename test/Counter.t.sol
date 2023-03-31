// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import "src/Counter.sol";

contract CounterTest is Test {
    Counter counter;
    CounterPreIncrement preIncrement;
    CounterPostIncrement postIncrement;
    CounterPlusEquals plusEquals;
    UncheckedCounterPreIncrement uncheckedPreIncrement;
    UncheckedCounterPostIncrement uncheckedPostIncrement;
    UncheckedCounterPlusEquals uncheckedPlusEquals;

    function setUp() public {
        counter = new Counter();
        preIncrement = new CounterPreIncrement();
        postIncrement = new CounterPostIncrement();
        plusEquals = new CounterPlusEquals();
        uncheckedPreIncrement = new UncheckedCounterPreIncrement();
        uncheckedPostIncrement = new UncheckedCounterPostIncrement();
        uncheckedPlusEquals = new UncheckedCounterPlusEquals();
    }

    function testPreIncrement() public {
        counter.preIncrement();
        assertEq(counter.i(), 1);
    }

    function testPostIncrement() public {
        counter.postIncrement();
        assertEq(counter.i(), 1);
    }

    function testPlusEquals() public {
        counter.plusEquals();
        assertEq(counter.i(), 1);
    }

    function test_fallback_preIncrement() public {
        preIncrement.preIncrement();
    }

    function test_fallback_postIncrement() public {
        postIncrement.postIncrement();
    }

    function test_fallback_plusEquals() public {
        plusEquals.plusEquals();
    }

    function test_unchecked_preIncrement() public {
        uncheckedPreIncrement.preIncrement();
    }

    function test_unchecked_postIncrement() public {
        uncheckedPostIncrement.postIncrement();
    }

    function test_unchecked_plusEquals() public {
        uncheckedPlusEquals.plusEquals();
    }
}
