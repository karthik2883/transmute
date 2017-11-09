var transmute = artifacts.require("./TransmuteAgent.sol")
var hlth_token_address = '0x0' //update before deploy

module.exports = function(deployer) {
    deployer.deploy(transmute, hlth_token_address)    
};
