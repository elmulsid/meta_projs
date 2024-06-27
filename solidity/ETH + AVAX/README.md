# Smart Contact

This Solidity contract provides a basic implementation of a token with functionalities for minting, burning, and transferring tokens. It allows users to create, destroy, and move tokens within a defined total supply. The contract utilizes require, assert, and revert statements for validation and error handling, ensuring safe and controlled operations.

## Description

The Smart contract offers a foundational structure for creating your own token on the Ethereum blockchain. It stores details like token name, abbreviation, and total supply as public variables. Additionally, it maintains a mapping that associates each user address with their token balance. The contract includes functions for:

Minting: Creates new tokens, increasing the total supply and assigning them to a recipient.
Burning: Destroys existing tokens, reducing the total supply and deducting them from the recipient's balance.
Transferring: Moves tokens from one address to another, maintaining the total supply.

## Validation and Error Handling:
require statements: Used for external validations and conditions that users should be aware of. They revert the transaction if the condition is not met, providing an informative error message.

assert statements: Used for internal checks that shouldn't happen in normal operation but should cause a revert if encountered. They typically don't provide custom error messages.

revert statements: Used intentionally to halt execution, sometimes with custom error messages. They can be used for testing purposes or for specific error conditions within the contract logic.
## Getting Started

### Installing

Solidity Compiler:
Download and install a Solidity compiler (https://docs.soliditylang.org/en/latest/installing-solidity.html). You can also use online IDEs like Remix (https://remix.ethereum.org/) that have built-in compilers.

Development Environment:
Choose a code editor or IDE that supports Solidity development. Popular options include Visual Studio Code with the Solidity extension or dedicated blockchain IDEs like Truffle (https://archive.trufflesuite.com/).

### Executing

Compile the Contract:
Use the Solidity compiler to compile the SmartContract.sol file into bytecode that can be deployed on the Ethereum blockchain. The specific command will vary depending on your chosen compiler and environment.

Deploy the Contract:
Connect your development environment to a test network (e.g., Rinkeby) and deploy the compiled bytecode of the MyToken contract. This process typically involves spending gas fees to interact with the network.

### Help
For common issues encountered while compiling or deploying the contract, refer to the Solidity documentation (https://docs.soliditylang.org/) for troubleshooting steps. Additionally, online communities and forums dedicated to Ethereum development can provide valuable assistance.

## Authors

Ezabella Mulsid
[@elmulsid](https://github.com/elmulsid)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
