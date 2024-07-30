const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  const contractName = "Counter";

  const Counter = await hre.ethers.getContractFactory(contractName);
  const contract = await Counter.deploy();
  await contract.deployed();

  console.log(`Counter contract deployed to: ${contract.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
