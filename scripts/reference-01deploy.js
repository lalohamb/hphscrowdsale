const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  // Deploy Token
  const Token = await hre.ethers.getContractFactory("Token");
  const token = await Token.deploy(
    "Hyde Park Alumni Token",
    "HPAT",
    hre.ethers.parseEther("1000000") // 1 million tokens
  );
  await token.waitForDeployment();
  console.log("Token deployed to:", await token.getAddress());

  // Set up crowdsale parameters
  const price = hre.ethers.parseEther("0.001"); // 0.001 ETH per token
  const maxTokens = hre.ethers.parseEther("500000"); // 500k tokens for sale
  const minimumGoal = hre.ethers.parseEther("100"); // 100 tokens minimum goal
  const minContribution = hre.ethers.parseEther("1"); // 1 token minimum
  const maxContribution = hre.ethers.parseEther("10000"); // 10k tokens maximum
  
  // Set opening time to 1 minute from now for testing
  const currentTime = Math.floor(Date.now() / 1000);
  const openingTime = currentTime + 60; // Current time + 1 minute
  const closingTime = openingTime + 86400; // 24 hours after opening

  console.log("\nSale Schedule:");
  console.log("Opening Time:", new Date(openingTime * 1000).toLocaleString());
  console.log("Closing Time:", new Date(closingTime * 1000).toLocaleString());

  // Deploy Crowdsale
  const Crowdsale = await hre.ethers.getContractFactory("Crowdsale");
  const crowdsale = await Crowdsale.deploy(
    await token.getAddress(),
    price,
    maxTokens,
    minimumGoal,
    minContribution,
    maxContribution,
    openingTime,
    closingTime
  );
  await crowdsale.waitForDeployment();
  console.log("\nCrowdsale deployed to:", await crowdsale.getAddress());

  // Transfer tokens to crowdsale contract
  const tokenAddress = await token.getAddress();
  const crowdsaleAddress = await crowdsale.getAddress();
  await token.transfer(crowdsaleAddress, maxTokens);
  console.log("Transferred", hre.ethers.formatEther(maxTokens), "tokens to crowdsale contract");

  // Save deployment addresses
  console.log("\nDeployment addresses:");
  console.log("TOKEN_CONTRACT_ADDRESS:", tokenAddress);
  console.log("CROWDSALE_CONTRACT_ADDRESS:", crowdsaleAddress);

  // Update the constants file with new addresses
  console.log("\nPlease update src/config/constants.ts with these addresses");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });