pragma solidity ^0.4.4;

contract Bandit {
  address owner = msg.sender;
  uint256 win = 1;
  uint256 lose = 0;

  function pullLever(uint userNumber) public returns (uint256) {
    uint randomNumber = uint(block.blockhash(block.number-1))%10 + 1;

    if (userNumber == randomNumber) {
      return win;
    }
    return lose;
  }

  function getCounter() public constant returns (uint256) {
    return win;
  }


  function kill() public {
    if(msg.sender == owner) {
      // Sends funds back to owner
      selfdestruct(owner);
    }
  }
}

// Bandit.deployed().then(function(instance){return instance.pullLever(1);});
