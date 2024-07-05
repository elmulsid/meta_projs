// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Voting {
  enum Vote { Yes, No }

  struct Voter {
    address voterAddress;
    bool hasVoted;
    Vote vote;
  }

  mapping(address => Voter) public voters;
  uint public yesVotes;
  uint public noVotes;

  
  function registerVoter(address voter) public {
    require(!voters[voter].hasVoted, "Voter already registered");
    voters[voter] = Voter(voter, false, Vote.Yes); // Default vote set to Yes
  }

  // Allows voting only for registered voters who haven't voted yet
  function castVote(Vote voteChoice) public {
    Voter storage voter = voters[msg.sender];
    require(voter.voterAddress != address(0), "Voter not registered");
    require(!voter.hasVoted, "Voter already voted");
    voter.hasVoted = true;
    voter.vote = voteChoice;
    if (voteChoice == Vote.Yes) {
      yesVotes++;
    } else {
      noVotes++;
    }
  }

  // Calculates total votes (should never be zero)
  function getTotalVotes() public view returns (uint) {
    uint totalVotes = yesVotes + noVotes;
    assert(totalVotes > 0); // Internal check (should always have some votes)
    return totalVotes;
  }

  fallback() external payable {revert("Sending funds directly to the contract is not allowed");}
  receive() external payable {}

  }

