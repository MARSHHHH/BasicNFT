//SPDX-License- Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    string public constant PUG =
        "https://bafybeifqxrgnbcbqepadrwnvkaizb5fdnknlwkuq5ulgw5bnrho6bfzvem.ipfs.dweb.link?filename=Attr.json";

    function run() external {
        //Get the address of the most rencently deployed BasicNft contract
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG);
        vm.stopBroadcast();
    }
}
