pragma solidity ^0.4.4;

contract Bandit {
  address owner = msg.sender;
  uint256 win = 1;
  uint256 lose = 0;

  function getRandomNumber() public constant returns (uint256) {
    uint randomNumber = uint(block.blockhash(block.number-1))%10 + 1;
    return randomNumber;
  }


  function kill() public {
    if(msg.sender == owner) {
      // Sends funds back to owner
      selfdestruct(owner);
    }
  }
}
