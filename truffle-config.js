require('dotenv').config();
const HDWalletProvider = require('@truffle/hdwallet-provider');

module.exports = {
  // Uncommenting the defaults below 
  // provides for an easier quick-start with Ganache.
  // You can also follow this format for other networks;
  // see <http://truffleframework.com/docs/advanced/configuration>
  // for more details on how to specify configuration options!
  //
  networks: {
   mainnet_fork: {
     host: "127.0.0.1",
     port: 8545,
     network_id: "*",
     gasPrice: 1e6,
     from: process.env.DEVELOPMENT_ADDRESS
   },
   kovan: {
    provider: () => new HDWalletProvider(process.env.MNEMONIC, process.env.DEVELOPMENT_WEB3_PROVIDER_URL_TO_BE_FORKED),
    from: '0xD2caC4687c1C277c27728Bfd3621Ab19A3b1b2Fd',
    network_id: '42',
  },
  //  test: {
  //    host: "127.0.0.1",
  //    port: 7545,
  //    network_id: "*"
  //  }
  },
  compilers: {
    solc: {
      version: "0.6.12",    // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      settings: {          // See the solidity docs for advice about optimization and evmVersion
       optimizer: {
         enabled: true,
         runs: 200
       },
      //  evmVersion: "byzantium"
      }
    }
  }
  //
};
