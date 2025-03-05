// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;



contract BoxV1 {
    uint256 internal value;


    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return value;
    }

    function version() public pure returns (uint256) {
        return 1;
    }
}