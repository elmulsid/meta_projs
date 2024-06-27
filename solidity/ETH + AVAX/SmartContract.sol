// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SmartContract {

  // Public variables here
  string public tokenName = "Shiba Inu";
  string public tokenAbbrv = "SHIB";
  uint public totalSupply = 0;

  // Mapping variable here
  mapping(address => uint) public balances;

  // Mint function with require for validation
  function mint(address recipient, uint amount) public {
    // Require: Ensure minting a non-zero amount
    require(amount > 0, "Mint amount must be greater than zero");

    // Increase total supply
    totalSupply += amount;

    // Increase balance of recipient
    balances[recipient] += amount;
  }

  // Burn function with require and revert
  function burn(address recipient, uint amount) public {
    // Require: Ensure recipient has enough balance to burn
    require(balances[recipient] >= amount, "Insufficient balance for burning");

    // Decrease total supply
    totalSupply -= amount;

    // Decrease balance of sender (assert for internal check)
    balances[recipient] -= amount;
    assert(balances[recipient] >= 0); // Assert to prevent accidental underflow

    // Revert if underflow still occurs (redundant but emphasizes safety)
    if (balances[recipient] < 0) {
      revert("Burning resulted in negative balance (shouldn't happen)");
    }
  }


}
