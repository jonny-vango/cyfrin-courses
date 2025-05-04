// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import {Script} from "forge-std/Script.sol";

contract HelperConfigScript is Script {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeedAddr;
    }

    function getSepoliaConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeedAddr: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }
    function getAnvilConfig() public returns (NetworkConfig memory) {}
}
