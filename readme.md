
# Health Nexus :: Transmute
<img align="right" src="./assets/HN_token_transparent.png?raw=true" height="348">
This smart-contract provides the Ethereum half of the functionality needed to move health cash (HLTH) from the Ethereum blockchain to the Health Nexus blockchain. 

Functionality:

* Require the contract be explicitedly authorized to spend HLTH, making it entirely voluntary.
* A HLTH owner that has authorized the TransmuteAgent contract can then create a valid transmute order which burns their HLTH tokens in the process.

## Installation

To clone and use this smart contract, you'll need [Git](https://git-scm.com) and [Node.js](https://nodejs.org/en/download/) (which comes with [npm](http://npmjs.com)), [Truffle](http://truffleframework.com/), and a local development Ethereum node on your computer ([Geth](https://github.com/ethereum/go-ethereum), [Parity](https://github.com/paritytech/parity)). 

From your command line:

```bash
# Clone this repository
$ git clone https://github.com/Health-Nexus/transmute.git

# Go into the repository
$ cd transmute

# Install dependencies
$ npm install

# Compile contracts
$ truffle compile

# Deploy contracts
$ truffle migrate
```

## Testing

```bash
# Test contracts
$ truffle test
```

