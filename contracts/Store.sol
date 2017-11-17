pragma solidity ^0.4.11;

contract HelloWorld {
  uint256 counter = 65;
  address owner = msg.sender;

  function add() public {
    counter++;
  }

  function subtract() public {
    counter--;
  }

  function getCounter() public constant returns (uint256) {
    return counter;
  }

  function getCount() public constant returns (uint256) {
    return counter;
  }

  function kill() public {
    if(msg.sender == owner) {
      // Sends funds back to owner
      selfdestruct(owner);
    }
  }
}

// StoreData.deployed().then(function(instance){return instance.set(4);});
// SimpleStorage.deployed().then(function(instance){return instance.get.call();}).then(function(value){return value.toNumber()});

// HelloWorld.deployed().then(function(instance){return instance.getCounter();});
