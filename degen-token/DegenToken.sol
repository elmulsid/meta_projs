// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    struct Item {
        uint256 price;
        uint256 stock;
        string name;
    }

    Item[] public items;

    mapping(address => mapping(uint256 => uint256)) public playerItems;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        _mint(msg.sender, 10 * (10 ** uint256(decimals())));

        items.push(Item({price: 100, stock: 100, name: "Sword"}));
        items.push(Item({price: 200, stock: 50, name: "Shield"}));
        // Add more items as needed
    }

    function redeemItem(uint256 itemId) public {
        Item storage item = items[itemId];
        require(item.stock > 0, "Item out of stock");
        require(balanceOf(msg.sender) >= item.price, "Not enough tokens to redeem");

        // Logic to deliver the item to the player
        playerItems[msg.sender][itemId]++;

        item.stock--;
        _burn(msg.sender, item.price);
    }



    function getItemName(uint256 itemId) public view returns (string memory) {
        return items[itemId].name;
    }

    function getItemPrice(uint256 itemId) public view returns (uint256) {
        return items[itemId].price;
    }

    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function burnTokens(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to burn");
        _burn(msg.sender, amount);
    }

   function transferTokens(address to, uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to transfer");
        _transfer(msg.sender, to, amount);
    }
}
