const Migrations = artifacts.require("Cat.sol");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};