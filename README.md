# ERC-20-Token-23A91A61J5MyToken (MTK)

MyToken is a basic yet fully operational ERC-20 cryptocurrency token deployed on the Ethereum blockchain using Remix IDE.
This repository was created as part of a blockchain learning exercise to explore how ERC-20 tokens function internally.

Overview

MyToken (MTK) follows the ERC-20 token standard, which defines a set of common functions enabling wallets, exchanges, and decentralized applications to interact consistently with tokens.

For this project, the token was implemented in Solidity, deployed through Remix’s JavaScript VM, and tested for the essential ERC-20 operations:

Sending tokens between accounts

Allowing another account to spend tokens on behalf of the owner

Delegated transfers using transferFrom

Checking token balances and allowances

Triggering Transfer and Approval events

Token Details
Property	Value
Name	MyToken
Symbol	MTK
Decimals	18
Total Supply	1,000,000 MTK (1e6 × 1e18)

Total supply at deployment (raw value):
1000000000000000000000000

The complete supply is assigned to the deploying address at the time of contract creation.

Features Implemented
ERC-20 Functions

totalSupply()

balanceOf(address)

transfer(address,uint256)

approve(address,uint256)

allowance(address,address)

transferFrom(address,address,uint256)

Events

Transfer

Approval

Safety / Validation

Blocks transfers to the zero address

Validates balances before transfers

Validates allowances before delegated transfers

Additional Helper Methods

getTokenInfo()

getTotalSupply()

Smart Contract File

contracts/MyToken.sol

Written using Solidity ^0.8.0, which includes built-in overflow and underflow protections.

Deployment Instructions (Remix IDE)

Visit https://remix.ethereum.org/

Create a new file: contracts/MyToken.sol

Paste the smart contract code into the file

Open Solidity Compiler

Compiler version: 0.8.x

EVM Version: London

Compile the contract

Open Deploy & Run Transactions

Environment: Remix VM (London)

Constructor arguments:

name: MyToken

symbol: MTK

decimals: 18

initialSupply: 1000000000000000000000000

Deploy the contract

The deployed instance will appear under Deployed Contracts

Testing (Results)
1. Token Metadata

name() → MyToken

symbol() → MTK

decimals() → 18

totalSupply() → 1000000000000000000000000

2. Token Transfer Test

Transfer of 1 MTK from the deployer to another account:

Deployer balance after transfer: 999999000000000000000000

Receiver balance: 1000000000000000000

3. Approval Test

Owner approved another address to spend 1 MTK:

approve(spender, 1000000000000000000)

4. Delegated Transfer (transferFrom)

Using the spender account:

transferFrom(deployer, thirdAccount, 1000000000000000000)


Result:

Transaction successful

Allowance reduced

Balances updated correctly

Transfer event recorded

Screenshots Included

All screenshots are available in the screenshots/ directory.

screenshots/
├── compilation.png
├── deployment.png
├── token-info.png
├── transfer-test.png
├── events.png

What I Learned

Key concepts gained from this project include:

Internal working model of ERC-20 tokens

Contract deployment and interaction using Remix IDE

Token balances, allowances, and delegated spending

Use of Solidity events for blockchain transparency

Important Solidity constructs: mappings, events, require, constructor, msg.sender

This project provided foundational hands-on experience in smart contract development and helped understand the underlying behavior of real-world tokens.

License

This project is released under the MIT License.

Conclusion

MyToken is a fully functional ERC-20 token implementation.
All token functionalities have been verified, event logs are working correctly, and the contract is compatible with wallets and dApps that follow the ERC-20 standard.
