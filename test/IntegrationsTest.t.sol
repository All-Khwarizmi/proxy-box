// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {DeployBoxScript} from "../script/DeployBox.s.sol";

contract IntegrationsTest is Test {
    BoxV1 boxV1;
    BoxV2 boxV2;
    DeployBoxScript deployV1;

    function setUp() public {
        deployV1 = new DeployBoxScript();
        boxV1 = deployV1.run();
    }

    function testDeployV1() public view {
        assertEq(boxV1.version(), 1);
    }
}
