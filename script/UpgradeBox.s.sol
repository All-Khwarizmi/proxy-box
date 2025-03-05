// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {DevOpsTools} from "@foundry-devops/DevOpsTools.sol";

contract UpgradeBoxScript is Script {
    function run() external returns (address proxyAddress) {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);

        vm.startBroadcast();
        BoxV2 newBox = new BoxV2();

        vm.stopBroadcast();

        proxyAddress = upgradeBox(mostRecentlyDeployed, newBox);
    }

    function upgradeBox(address proxyAddress, BoxV2 newBox) public returns (address) {
        console.log("Upgrading BoxV1 at address:", proxyAddress);
        BoxV1 proxy = BoxV1(proxyAddress);
        console.log("Box Version", proxy.version());
        vm.startBroadcast();

        proxy.upgradeToAndCall(address(newBox), "");
        vm.stopBroadcast();

        console.log("Upgraded BoxV1 at address:", address(proxy));
        return address(proxy);
    }
}
