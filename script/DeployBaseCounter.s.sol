// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {BaseCounter} from "../src/BaseCounter.sol";

contract DeployBaseCounter is Script {
    function run() external returns (address) {
        address baseCounter = deployBaseCounter();
        return baseCounter;
    }

    function deployBaseCounter() public returns (address) {
        vm.startBroadcast();
        BaseCounter baseCounter = new BaseCounter();
        vm.stopBroadcast();
        return address(baseCounter);
    }
}
