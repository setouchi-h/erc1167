// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {BaseCounter} from "./BaseCounter.sol";
import {CloneFactory} from "./CloneFactory.sol";

contract CounterFactory is CloneFactory, Ownable {
    address private s_baseCounter;
    address[] private s_counters;

    constructor(address baseCounter) {
        s_baseCounter = baseCounter;
    }

    function createToken(string memory name, uint256 number) external onlyOwner returns (address) {
        address clone = createClone(s_baseCounter);
        BaseCounter(clone).initialize(name, number);
        s_counters.push(clone);
        return clone;
    }

    function counterOf(uint256 index) external view returns (address) {
        return s_counters[index];
    }
}
