// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployBoxScript is Script {
    function run() external returns (address proxy) {
        return deployBox();
    }

    function deployBox() private returns (BoxV1 box) {
        vm.startBroadcast();
        box = new BoxV1();
        vm.stopBroadcast();
        console.log("Deployed BoxV1 at address:", address(box));
    }
}
