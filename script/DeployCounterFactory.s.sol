// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {CounterFactory} from "../src/CounterFactory.sol";
import {DeployBaseCounter} from "./DeployBaseCounter.s.sol";

contract DeployCounterFactory is Script {
    function run() external returns (address) {
        address baseCounter = new DeployBaseCounter().run();
        address counterFactory = deployCounterFactory(baseCounter);
        return counterFactory;
    }

    function deployCounterFactory(address baseCounter) public returns (address) {
        vm.startBroadcast();
        CounterFactory counterFactory = new CounterFactory(baseCounter);
        vm.stopBroadcast();
        return address(counterFactory);
    }
}
