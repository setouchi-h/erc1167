// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployBaseCounter} from "../script/DeployBaseCounter.s.sol";
import {DeployCounterFactory} from "../script/DeployCounterFactory.s.sol";
import {BaseCounter} from "../src/BaseCounter.sol";
import {CounterFactory} from "../src/CounterFactory.sol";

contract DeployAndCloneTest is Test {
    DeployCounterFactory public deployer;

    address public factory;

    function setUp() public {
        deployer = new DeployCounterFactory();
        factory = deployer.run();
    }

    function testCreateCounter() public {
        vm.startBroadcast();
        address counter_1 = CounterFactory(factory).createToken("test_1", 0);
        address counter_2 = CounterFactory(factory).createToken("test_2", 1);
        vm.stopBroadcast();

        assertEq(CounterFactory(factory).counterOf(0), counter_1);
        assertEq(CounterFactory(factory).counterOf(1), counter_2);
        assertEq(BaseCounter(counter_1).getName(), "test_1");
        assertEq(BaseCounter(counter_1).getNumber(), 0);
        assertEq(BaseCounter(counter_2).getName(), "test_2");
        assertEq(BaseCounter(counter_2).getNumber(), 1);
    }

    function testIncrement() public {
        vm.startBroadcast();
        address counter_1 = CounterFactory(factory).createToken("test_1", 0);
        address counter_2 = CounterFactory(factory).createToken("test_2", 1);
        vm.stopBroadcast();

        BaseCounter(counter_1).increment();
        BaseCounter(counter_2).increment();

        assertEq(BaseCounter(counter_1).getNumber(), 1);
        assertEq(BaseCounter(counter_2).getNumber(), 2);
    }
}
