// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseCounter {
    string private s_name;
    uint256 public s_number;
    bool private s_initialized;

    function initialize(string memory name, uint256 number) public {
        s_name = name;
        s_number = number;
        s_initialized = true;
    }

    function setNumber(uint256 newNumber) public {
        s_number = newNumber;
    }

    function increment() public {
        s_number++;
    }

    function getName() public view returns (string memory) {
        return s_name;
    }

    function getNumber() public view returns (uint256) {
        return s_number;
    }
}
