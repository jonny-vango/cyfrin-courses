// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfigScript} from "./HelperConfig.s.sol";

contract DeployFundMeScript is Script {
    function run() external returns (FundMe) {
        HelperConfigScript helperConfig = new HelperConfigScript();
        address priceFeed = helperConfig.activeNetworkConfig.priceFeedAddr;
        vm.startBroadcast();
        FundMe fundMe = new FundMe(priceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
