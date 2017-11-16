pragma solidity ^0.4.11

contract Lottery {
  address owner;

  struct Participant {
    string name;
    address account;
    bool entered;
  }

  Participant[] public paticipants;

  function addParticipant(string name, address account) {
    require(msg.sender == owner);
    participants.push(Participant({
      name: name,
      account: account,
      entered: false
    }));
  }

  function Lottery() {
    owner = msg.sender;
  }

  function kill() public {
    if(msg.sender == owner) {
      selfdestruct(owner);
    }
  }
}
