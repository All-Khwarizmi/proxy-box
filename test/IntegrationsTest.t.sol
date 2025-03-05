// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {DeployBoxScript} from "../script/DeployBox.s.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {UpgradeBoxScript} from "../script/UpgradeBox.s.sol";

contract IntegrationsTest is Test {
    BoxV1 boxV1;
    BoxV2 boxV2;
    DeployBoxScript deployBox;
    UpgradeBoxScript upgradeBox;
    address proxy;

    function setUp() public {
        deployBox = new DeployBoxScript();
        upgradeBox = new UpgradeBoxScript();
    }

    function testDeployV1() public {
        boxV1 = BoxV1(deployBox.deployBox());
        assertEq(boxV1.version(), 1);
    }

    function testBothBoxesHaveTheSameProxyAddress() public {
        proxy = deployBox.deployBox();
        boxV1 = BoxV1(proxy);

        upgradeBox.upgradeBox(proxy, new BoxV2());
        boxV2 = BoxV2(proxy);

        assertEq(address(boxV1), address(boxV2));
    }

    function testUpgradeV1ToV2() public {
        proxy = deployBox.deployBox();

        boxV1 = BoxV1(proxy);
        assertEq(boxV1.version(), 1);

        upgradeBox.upgradeBox(proxy, new BoxV2());

        boxV2 = BoxV2(proxy);
        assertEq(boxV2.version(), 2);
    }
}
