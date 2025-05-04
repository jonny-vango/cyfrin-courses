// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfigScript} from "./HelperConfig.s.sol";

contract DeployFundMeScript is Script {
    function run() external returns (FundMe) {
        // Before startBroadcast() => Not a "real" tx
        HelperConfigScript helperConfig = new HelperConfigScript();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        // After startBroadcast() => "Real" tx
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
