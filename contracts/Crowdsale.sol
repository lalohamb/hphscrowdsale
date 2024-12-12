// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./Token.sol";

contract Crowdsale {
    address public owner;
    Token public token;
    uint256 public price; // Price per token in wei
    uint256 public maxTokens; // Maximum tokens to be sold
    uint256 public tokensSold; // Total tokens sold
    uint256 public minimumGoal; // Minimum goal in wei
    uint256 public minContributionAmount; // Minimum contribution in tokens
    uint256 public maxContributionAmount; // Maximum contribution in tokens
    uint256 public openingTime; // Time when the crowdsale starts
    uint256 public closingTime; // Time when the crowdsale ends
    bool public goalReached = false; // Whether the goal has been reached
    uint256 public totalContributors; // Total number of unique contributors
    mapping(address => uint256) public contributions; // Mapping to track individual contributions
    mapping(address => bool) public hasContributed; // To check if an address has contributed

    event Buy(uint256 amount, address buyer);
    event Finalize(uint256 tokensSold, uint256 ethRaised);
    event Refund(address buyer, uint256 amount);
    event GoalReached(uint256 amountRaised);

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime && block.timestamp <= closingTime, "Crowdsale is not open");
        _;
    }

    modifier afterSaleClosed() {
        require(block.timestamp > closingTime, "Crowdsale is still open");
        _;
    }

    constructor(
        Token _token,
        uint256 _price,
        uint256 _maxTokens,
        uint256 _minimumGoal,
        uint256 _minContribution,
        uint256 _maxContribution,
        uint256 _openingTime,
        uint256 _closingTime
    ) {
        owner = msg.sender;
        token = _token;
        price = _price;
        maxTokens = _maxTokens;
        minimumGoal = _minimumGoal;
        minContributionAmount = _minContribution;
        maxContributionAmount = _maxContribution;
        openingTime = _openingTime;
        closingTime = _closingTime;
    }

    // Buy tokens directly by sending Ether
    receive() external payable onlyWhileOpen {
        uint256 amount = msg.value / price;
        buyTokens(amount * 1e18);
    }

    // Buy tokens with specified amount
    function buyTokens(uint256 _amount) public payable onlyWhileOpen {
        uint256 tokenAmount = _amount / 1e18; // Convert _amount to actual token units
        uint256 contributionAmount = tokenAmount * price;

        require(msg.value == contributionAmount, "Incorrect Ether value sent");
        require(token.balanceOf(address(this)) >= _amount, "Not enough tokens available");
        require(contributions[msg.sender] + tokenAmount <= maxContributionAmount, "Exceeds maximum contribution");
        require(contributions[msg.sender] + tokenAmount >= minContributionAmount, "Below minimum contribution");

        // Track the contribution for refunds
        contributions[msg.sender] += tokenAmount;

        // Track contributors to allow refunds and goal verification
        if (!hasContributed[msg.sender]) {
            totalContributors++;
            hasContributed[msg.sender] = true;
        }

        tokensSold += tokenAmount;
        require(token.transfer(msg.sender, _amount), "Token transfer failed");

        emit Buy(_amount, msg.sender);
    }

    // Finalize Sale
    function finalize() public onlyOwner afterSaleClosed {
        require(!goalReached, "Crowdsale goal was met, cannot finalize");
        if (tokensSold >= minimumGoal) {
            goalReached = true;
            emit GoalReached(tokensSold);
        }

        uint256 value = address(this).balance;
        (bool sent, ) = owner.call{value: value}("");
        require(sent, "Failed to send Ether to owner");

        emit Finalize(tokensSold, value);
    }

    // Refund function if the goal is not met
    function claimRefund() public afterSaleClosed {
        require(!goalReached, "Crowdsale was successful, no refunds");
        uint256 contributionAmount = contributions[msg.sender];
        require(contributionAmount > 0, "No contributions to refund");

        // Reset the contribution
        contributions[msg.sender] = 0;
        
        // Refund the investor
        payable(msg.sender).transfer(contributionAmount * price / 1e18);

        emit Refund(msg.sender, contributionAmount);
    }



    // Getters
    function rate() external view returns (uint256) {
        return price;
    }

    function weiRaised() external view returns (uint256) {
        return address(this).balance;
    }

    function goal() external view returns (uint256) {
        return minimumGoal;
    }

    function totalContributorsCount() external view returns (uint256) {
        return totalContributors;
    }

    function isOpen() external view returns (bool) {
        return block.timestamp >= openingTime && block.timestamp <= closingTime;
    }

    function hasEnded() external view returns (bool) {
        return block.timestamp > closingTime;
    }

    // Helper function to check if the sale has ended
    function hasSaleEnded() public view returns (bool) {
        return block.timestamp > closingTime;
    }

    // Get the remaining tokens for sale
    function remainingTokens() public view returns (uint256) {
        return token.balanceOf(address(this));
    }

    // Get total funds raised in the crowdsale (in ETH)
    function getRaised() public view returns (uint256) {
        return address(this).balance;
    }

    // Owner can withdraw unsold tokens after the crowdsale is finalized
    function withdrawUnsoldTokens() public onlyOwner afterSaleClosed {
        require(token.transfer(owner, token.balanceOf(address(this))), "Transfer failed");
    }
}
