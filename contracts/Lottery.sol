pragma solidity ^0.4.0;

contract Lottery {
  // Declare owner variable
  address owner;
  uint public nonce = 0;

  // Mapping of addresses to participant structures
  mapping(address => uint) public participantsNumbers;
  address[] public participants;
  address[] public winners;
  uint numberOfParticipants = 0;

  // Constructor function
  function Lottery() public {
    // Set owner to address of contract initiator
    owner = msg.sender;
    // Add contract initiator to participants
    addParticipant(msg.sender);
  }

  // Declare kill function
  function kill() public {
    if(msg.sender == owner) {
      selfdestruct(owner);
    }
  }

  function draw() public returns (address[]) {
    // Increment the nonce for the next random value
    nonce++;
    // Generate random number from 1 - 10
    // uint randomNumber = uint(keccak256(nonce))%10;
    uint randomNumber = 1;

    // Map over the participants
    for (uint i = 0; i < numberOfParticipants; i++) {
      // Get the participants address
      address participant = participants[i];
      //Check if the participants selected number is the same as the random number
      if (participantsNumbers[participant] == randomNumber) {
        // Add the participant to the winners array
        winners.push(participant);
      }
    }

    return winners;
  }

  function enterDraw(uint number) payable public {
    require(participantsNumbers[msg.sender] == 0);
    // require(msg.value == 3000000000000000);
    participantsNumbers[msg.sender] = number;
  }

  // Function for entering someone into the draw
  function enterParticipant(address account, uint number) public {
    require(msg.sender == owner);
    require(participantsNumbers[account] == 0);
    participantsNumbers[account] = number;
  }

  // Function to add participant
  function addParticipant(address account) public {
    require(msg.sender == owner);
    // Set participants address
    participants.push(account);
    // Set participant entered to false
    participantsNumbers[account] = 0;
    numberOfParticipants++;
  }

  function getParticipants() public constant returns (address[]) {
    return participants;
  }

  function isParticipantEntered(address account) public constant returns (bool) {
    if (participantsNumbers[account] != 0) {
      return true;
    }
    return false;
  }

}

// Accounts:
// (0) 0x627306090abab3a6e1400e9345bc60c78a8bef57
// (1) 0xf17f52151ebef6c7334fad080c5704d77216b732
// (2) 0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef
// (3) 0x821aea9a577a9b44299b9c15c88cf3087f3b5544
// (4) 0x0d1d4e623d10f9fba5db95830f7d3839406c6af2
// (5) 0x2932b7a2355d6fecc4b5c0b6bd44cc31df247a2e
// (6) 0x2191ef87e392377ec08e7c08eb105ef5448eced5
// (7) 0x0f4f2ac550a1b4e2280d04c21cea7ebd822934b5
// (8) 0x6330a553fc93768f612722bb8c2ec78ac90b3bbc
// (9) 0x5aeda56215b167893e80b4fe645ba6d5bab767de

// Draw winner
// Lottery.deployed().then(function(instance){return instance.draw.call();}).then(function(value){return value});

// Enter enterDraw
// Lottery.deployed().then(function(instance){return instance.enterDraw(1);});

// Enter participant
// Lottery.deployed().then(function(instance){return instance.enterParticipant('0xf17f52151ebef6c7334fad080c5704d77216b732', 5);});

// Get participants
// Lottery.deployed().then(function(instance){return instance.getParticipants.call();}).then(function(value){return value});

// Add participant
// Lottery.deployed().then(function(instance){return instance.addParticipant('0xf17f52151ebef6c7334fad080c5704d77216b732');});



// Check is participant has entered
// Lottery.deployed().then(function(instance){return instance.isParticipantEntered('0xf17f52151ebef6c7334fad080c5704d77216b732');});
