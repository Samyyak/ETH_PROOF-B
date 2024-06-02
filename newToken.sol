// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function  then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

    // public variables here
   string public tokenName = "Quantum Coin";
   string public tokenAbbrv = "QTC";
   uint public totalSupply = 0;

    // mapping variable here
    mapping(address => uint) public balance;

    // Event to log minting of tokens
    event Mint(address indexed to, uint256 value);

    // Event to log burning of tokens
    event Burn(address indexed from, uint256 value);

    // mint function
    function mint(address Address, uint Value) public {
      totalSupply += Value;
      balance[Address] += Value;
      emit Mint(Address, Value); 
    }

    // burn function
    function burn(address Address, uint Value) public {
      require(balance[Address] >= Value, "Insufficient balance to burn"); 
      totalSupply -= Value;
      balance[Address] -= Value;
      emit Burn(Address, Value); 
    }
    
   }

