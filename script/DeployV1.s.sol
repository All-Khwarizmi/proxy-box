// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";

contract DeployV1Script is Script {
    function run() external returns (BoxV1 box) {
        return deployV1();
    }

    function deployV1() private returns (BoxV1 box) {
        vm.startBroadcast();
        box = new BoxV1();
        vm.stopBroadcast();
        console.log("Deployed BoxV1 at address:", address(box));
    }
}
