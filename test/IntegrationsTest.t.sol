// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {DeployBoxScript} from "../script/DeployBox.s.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract IntegrationsTest is Test {
    BoxV1 boxV1;
    BoxV2 boxV2;
    DeployBoxScript deployBox;
    ERC1967Proxy proxy;

    function setUp() public {
        deployBox = new DeployBoxScript();
        proxy = ERC1967Proxy(payable(deployBox.run()));
    }

    function testDeployV1() public view {
        assertEq(boxV1.version(), 1);
    }
}
