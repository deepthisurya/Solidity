pragma solidity >=0.6.0 <0.8.0;


//This pure keyword makes sure no gas is spent
contract HelloWorld {
  function helloWorld() external pure returns (string memory) {
    return "Hello, World!";
  }
}
