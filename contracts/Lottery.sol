pragma solidity ^0.4.11;

contract Lottery {
  // Declare owner variable
  address owner;
  uint public nonce = 0;

  // Declare participants array
  address[10] public participants;
  uint numberOfParticipants = 0;

  // Constructor function
  function Lottery() public {
    // Set owner to address of contract initiator
    owner = msg.sender;
  }

  // Fallback function
  function() payable {}

  // Declare kill function
  function kill() public {
    if(msg.sender == owner) {
      selfdestruct(owner);
    }
  }

  function draw() public {
    // Increment the nonce for the next random value
    nonce++;
    // Generate random number from 1 - 100
    uint randomNumber = uint(keccak256(nonce))%10;
    // Transfer all wei to winner if exists
    address winner = participants[randomNumber];
    if (winner != 0x0) {
      winner.transfer(this.balance);
    }

    // Reset variables
    for (uint i = 0; i < numberOfParticipants; ++i) {
      participants[i] = 0x0;
    }
    numberOfParticipants = 0;
  }

  function enterDraw(address participant) payable public {
    // Require that the number of participants has not gone over 10
    require(numberOfParticipants < 9);
    // Require that the sent value is equal to 3000000000000000 wei (roughly £1)
    require(msg.value == 3000000000000000);
    // Transfer the sent value to the contract to hold
    this.transfer(msg.value);
    // Add participant to participants array
    participants[numberOfParticipants] = participant;
    // Increment the number of participants
    numberOfParticipants++;
  }

  function getParticipants() public constant returns (address[10]) {
    return participants;
  }

  function getContractBalance() public constant returns (uint) {
    return this.balance;
  }
}

// Accounts:
// (0) "0x627306090abab3a6e1400e9345bc60c78a8bef57", 99738699800000000000 => 99733825400000000000
// (1) "0xf17f52151ebef6c7334fad080c5704d77216b732",
// (2) "0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef",
// (3) "0x821aea9a577a9b44299b9c15c88cf3087f3b5544",
// (4) "0x0d1d4e623d10f9fba5db95830f7d3839406c6af2",
// (5) "0x2932b7a2355d6fecc4b5c0b6bd44cc31df247a2e",
// (6) "0x2191ef87e392377ec08e7c08eb105ef5448eced5",
// (7) "0x0f4f2ac550a1b4e2280d04c21cea7ebd822934b5",
// (8) "0x6330a553fc93768f612722bb8c2ec78ac90b3bbc",
// (9) "0x5aeda56215b167893e80b4fe645ba6d5bab767de",
