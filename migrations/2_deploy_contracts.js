var transmute = artifacts.require("./TransmuteAgent.sol")

module.exports = function(deployer) {
    deployer.deploy(transmute, '0x0')    
};
