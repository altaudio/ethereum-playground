var HelloWorld = artifacts.require("HelloWorld");
var Lottery = artifacts.require("Lottery");

module.exports = function(deployer) {
  deployer.deploy(HelloWorld);
  deployer.deploy(Lottery);
};
