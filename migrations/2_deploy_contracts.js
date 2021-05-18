// const ConvertLib = artifacts.require("ConvertLib");
const Aavetrage = artifacts.require("Aavetrage");

module.exports = function(deployer) {
  // deployer.deploy(ConvertLib);
  // deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(Aavetrage);
};
