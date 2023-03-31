// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Counter {
    uint256 public i;

    function preIncrement() public {
        ++i;
    }

    function postIncrement() public {
        i++;
    }

    function plusEquals() public {
        i += 1;
    }
}

contract CounterPreIncrement {
    uint256 internal i;

    function preIncrement() external {
        ++i;
    }
}

contract CounterPostIncrement {
    uint256 internal i;

    function postIncrement() external {
        i++;
    }
}

contract CounterPlusEquals {
    uint256 internal i;

    function plusEquals() external {
        i += 1;
    }
}

contract UncheckedCounterPreIncrement {
    uint256 internal i;

    function preIncrement() external {
        unchecked {
            ++i;
        }
    }
}

contract UncheckedCounterPostIncrement {
    uint256 internal i;

    function postIncrement() external {
        unchecked {
            i++;
        }
    }
}

contract UncheckedCounterPlusEquals {
    uint256 internal i;

    function plusEquals() external {
        unchecked {
            i += 1;
        }
    }
}

