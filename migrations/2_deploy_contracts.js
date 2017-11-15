var HelloWorld = artifacts.require("HelloWorld");
var Bandit = artifacts.require("Bandit");

module.exports = function(deployer) {
  deployer.deploy(HelloWorld);
  deployer.deploy(Bandit);
};
