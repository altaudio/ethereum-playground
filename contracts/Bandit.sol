pragma solidity ^0.4.4;

contract Bandit {
  address owner = msg.sender;
  uint win = 1;
  uint lose = 0;
  uint nonce = 1;

  function getRandomNumber() public returns (uint) {
    nonce++;
    return nonce;
  }


  function kill() public {
    if(msg.sender == owner) {
      // Sends funds back to owner
      selfdestruct(owner);
    }
  }
}

// Bandit.deployed().then(function(instance){return instance.getRandomNumber.call();}).then(function(value){return value.toNumber()});

