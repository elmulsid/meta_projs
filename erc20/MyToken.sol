// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RuiToken is ERC20, Ownable   {
    // Total supply of the token
   uint256 public constant TOTAL_SUPPLY = 1000;

   constructor() ERC20("RuiToken", "RUI") Ownable(msg.sender) {
      // Mint the total supply to the contract owner
      _mint(msg.sender, TOTAL_SUPPLY);
    }

    // Only the contract owner can mint new tokens
   function mint(address to, uint256 amount) public onlyOwner  {
       _mint(to, amount);
    }

    // Any user can transfer tokens
   function transfer(address recipient, uint256 amount) public override returns (bool)  {
        _transfer(msg.sender, recipient, amount);
       return true;
     }

    // Any user can burn tokens they own
   function burn(uint256 amount) public  {
       _burn(msg.sender, amount);
    }
}