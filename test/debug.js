require('dotenv').config();

// debug contracts
const Aavetrage = artifacts.require("Aavetrage");
const erc20ABI = require('../interfaces/erc20');
const collateralAssetAddress = '0x6B175474E89094C44Da98b954EedeAC495271d0F';
const collateralAsset = new web3.eth.Contract(erc20ABI, collateralAssetAddress);

contract("Aavetrage Test Suite", async accounts => {

    // it("should successfully call peek", async () => {
    //     const aavetrage = await Aavetrage.deployed();
    //     const opportunityExists = await aavetrage.peek.call()
    //     console.log(`opportunityExists: ${opportunityExists}`)
    // });

    it("should successfully call guap", async () => {
        // get a handle to aavetrage
        const aavetrage = await Aavetrage.deployed();

        // approve aavetrage to spend my tokens
        const approveAmount = web3.utils.toBN(2).pow(web3.utils.toBN(256)).sub(web3.utils.toBN(1));
        await collateralAsset.methods.approve(aavetrage.address, approveAmount.toString()).send({from: process.env.DEVELOPMENT_ADDRESS});

        // call guap
        await aavetrage.guap({from: process.env.DEVELOPMENT_ADDRESS})
    });

});