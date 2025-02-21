
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract GreetingWithETH {
    struct Greeting {
        address sender;
        string message;
        uint256 amount;
        uint256 timestamp;
    }

    Greeting[] public greetings;
    event GreetingSent(address indexed sender, string message, uint256 amount, uint256 timestamp);

    function sendGreeting(string memory _message) public payable {
        require(msg.value > 0, "Must send some ETH");
        greetings.push(Greeting(msg.sender, _message, msg.value, block.timestamp));
        emit GreetingSent(msg.sender, _message, msg.value, block.timestamp);
    }

    function getGreetings() public view returns (Greeting[] memory) {
        return greetings;
    }
}
