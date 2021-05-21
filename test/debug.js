require('dotenv').config();

const truffleAssert = require('truffle-assertions');
const Aavetrage = artifacts.require("Aavetrage");
const erc20ABI = require('../interfaces/erc20');
const collateralAssetAddress = '0x99b267b9D96616f906D53c26dECf3C5672401282';
const collateralAsset = new web3.eth.Contract(erc20ABI, collateralAssetAddress);

contract("Aavetrage Test Suite", async accounts => {

    it("should successfully call peek", async () => {
        // get a handle to aavetrage
        const aavetrage = await Aavetrage.deployed();
        
        // call peek
        const peekTransaction = await aavetrage.peek({from: process.env.DEVELOPMENT_ADDRESS});

        // assert that we successfully identified an arb opportunity
        truffleAssert.eventEmitted(peekTransaction, 'Peek', (event) => {
            return event.arbitrageIdentified == true;
        });
    });

    it("should successfully call guap", async () => {
        // get a handle to aavetrage
        const aavetrage = await Aavetrage.deployed();

        // approve aavetrage to spend up to (2^256 - 1) of callers' tokens
        const approveAmount = web3.utils.toBN(2).pow(web3.utils.toBN(256)).sub(web3.utils.toBN(1));
        await collateralAsset.methods.approve(aavetrage.address, approveAmount.toString()).send({from: process.env.DEVELOPMENT_ADDRESS});

        // call guap
        await aavetrage.guap({from: process.env.DEVELOPMENT_ADDRESS})
    });

});