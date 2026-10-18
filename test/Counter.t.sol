// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.37;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    address public owner;
    address public user1;
    address public user2;

    function setUp() public {
        owner = address(0x1);
        user1 = address(0x2);
        user2 = address(0x3);

        counter = new Counter();
    }

    // ============ INITIALIZATION TESTS ============

    function test_Initialization() public view {
        assertEq(counter.number(), 0);
    }

    // ============ SET NUMBER TESTS ============

    function test_SetNumber() public {
        vm.prank(user1);
        counter.setNumber(42);

        assertEq(counter.number(), 42);
    }

    function test_SetNumber_Zero() public {
        vm.prank(user1);
        counter.setNumber(100);
        assertEq(counter.number(), 100);

        vm.prank(user2);
        counter.setNumber(0);
        assertEq(counter.number(), 0);
    }

    function test_SetNumber_MaxUint() public {
        vm.prank(user1);
        counter.setNumber(type(uint256).max);

        assertEq(counter.number(), type(uint256).max);
    }

    // ============ INCREMENT TESTS ============

    function test_Increment() public {
        vm.prank(user1);
        counter.increment();

        assertEq(counter.number(), 1);
    }

    function test_Increment_Multiple() public {
        vm.prank(user1);
        counter.increment();
        assertEq(counter.number(), 1);

        vm.prank(user2);
        counter.increment();
        assertEq(counter.number(), 2);

        vm.prank(user1);
        counter.increment();
        assertEq(counter.number(), 3);
    }

    function test_Increment_FromSetNumber() public {
        vm.prank(user1);
        counter.setNumber(99);

        vm.prank(user2);
        counter.increment();

        assertEq(counter.number(), 100);
    }

    function test_RevertWhen_Increment_Overflows() public {
        vm.prank(user1);
        counter.setNumber(type(uint256).max);

        vm.prank(user2);
        vm.expectRevert();
        counter.increment();
    }

    // ============ COMBINED SCENARIO TESTS ============

    function test_FullWorkflow() public {
        // 1. Initial state
        assertEq(counter.number(), 0);

        // 2. Set a value
        vm.prank(user1);
        counter.setNumber(10);
        assertEq(counter.number(), 10);

        // 3. Increment twice
        vm.prank(user2);
        counter.increment();
        assertEq(counter.number(), 11);

        vm.prank(user1);
        counter.increment();
        assertEq(counter.number(), 12);

        // 4. Overwrite value
        vm.prank(user2);
        counter.setNumber(1000);
        assertEq(counter.number(), 1000);

        // 5. Increment again
        vm.prank(user1);
        counter.increment();
        assertEq(counter.number(), 1001);
    }
}
