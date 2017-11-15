pragma solidity ^0.4.4;

contract Bandit {
  address owner = msg.sender;

  function pullLever(uint userNumber) public returns (uint) {
    uint randomNumber = uint(block.blockhash(block.number-1))%10 + 1;

    if (userNumber == randomNumber) {
      return 1;
    }
    return 0;
  }


  function kill() public {
    if(msg.sender == owner) {
      // Sends funds back to owner
      selfdestruct(owner);
    }
  }
}
