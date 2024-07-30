require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9", // Adjust the Solidity version as needed
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545"
    }
  }
};
