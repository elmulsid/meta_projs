# MyToken Contact

This Solidity contract provides a basic implementation of a token with functionalities for minting and burning. It allows users to create and destroy tokens within a defined total supply.

## Description

MyToken contract offers a foundational structure for creating your own token on the Ethereum blockchain. It stores details like token name, abbreviation, and total supply as public variables. Additionally, it maintains a mapping that associates each user address with their token balance. The contract includes functions for minting new tokens (increasing total supply and assigning them to a recipient) and burning existing tokens (reducing total supply and deducting them from the recipient's balance).

## Getting Started

### Installing

Solidity Compiler:
Download and install a Solidity compiler (https://docs.soliditylang.org/en/latest/installing-solidity.html). You can also use online IDEs like Remix (https://remix.ethereum.org/) that have built-in compilers.

Development Environment:
Choose a code editor or IDE that supports Solidity development. Popular options include Visual Studio Code with the Solidity extension or dedicated blockchain IDEs like Truffle (https://archive.trufflesuite.com/).

### Executing

Compile the Contract:
Use the Solidity compiler to compile the MyToken.sol file into bytecode that can be deployed on the Ethereum blockchain. The specific command will vary depending on your chosen compiler and environment.

Deploy the Contract:
Connect your development environment to a test network (e.g., Rinkeby) and deploy the compiled bytecode of the MyToken contract. This process typically involves spending gas fees to interact with the network.

### Help
For common issues encountered while compiling or deploying the contract, refer to the Solidity documentation (https://docs.soliditylang.org/) for troubleshooting steps. Additionally, online communities and forums dedicated to Ethereum development can provide valuable assistance.

## Authors

Ezabella Mulsid
[@elmulsid](https://github.com/elmulsid)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
