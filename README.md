# ETH:Creating Token 

This Solidity program provides simple functionality for creating tokens on the blockchain.

## Description

This program consists of simple functions and variables which helps in mapping of the data along with its minting and also helps us to burn the resources whenever needed.

## Getting Started

This program contains straightforward functions and variables designed for mapping data, minting tokens, and burning resources as necessary.Some special keywords like "event" and "emit" are added as to make the code more functional.

### Executing program

To run this program, you can utilize Remix, an online Solidity IDE. Begin by navigating to the Remix website at https://remix.ethereum.org/.

Once you're on the Remix website, initiate a new file by selecting the "+" icon in the left-hand sidebar. Save the file with a .sol extension (for instance, myToken.sol). Then, copy and paste the provided code into the file.

```javascript
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile NewToken.sol"(or whatever the file name) button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "NewToken" contract from the dropdown menu, and then click on the "Deploy" button.

Now inorder for the Deployment to work we have to enter the TokenName and TokenAbbreviation beforehand. Then the project will be deployed after which we can select any of the default addresses given before hand to us. 
The address is then used to set a value to it as well as check balance in it. Different addresses act like different users and different operations can be performed on it.

## Authors

Samyak Jain
[@Chandigarh University](www.linkedin.com/in/samyak-jain-179710233)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
