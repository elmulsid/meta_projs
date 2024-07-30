// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Counter {
  uint public constant MAX_VALUE = 100; // Maximum allowed count

  uint public count;

  function increment(uint _value) public {
    require(count + _value <= MAX_VALUE, "Counter overflow");
    count += _value;
  }

  function decrement(uint _value) public {
    require(count >= _value, "Counter underflow");
    count -= _value;
  }

  function reset() public {
    count = 0;
  }
}
