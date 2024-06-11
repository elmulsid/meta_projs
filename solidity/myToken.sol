// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


contract MyToken {

    // public variables here
    string public tokenname="Shiba Inu";
    string public tokenabbrv="SHIB";
    uint public totalSupply=0;

    // mapping variable here
    mapping(address => uint) public balances;

    // mint function
    function mint(address recipient, uint amount) public {
        // Increase total supply
        totalSupply += amount;

        // Increase balance of recipient
        balances[recipient] += amount;
    }

    // burn function
    function burn(address recipient, uint amount) public {
        // Check if recipient has enough balance
        if(balances[recipient] >= amount) {
            // Decrease total supply
            totalSupply -= amount;

            // Decrease balance of sender
            balances[recipient] -= amount;
        }
        }


}
