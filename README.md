# solidity-playground

Contracts written in Solidity, using Truffle for deployment and testing. 

These are primarily for personal development, in order of when I wrote them (the last one in the list is the most recent and best representation of my understanding of Solidity). I started by using the decypher.tv tutorials for inspiration, implementing proposed contracts before watching their coresponding videos. I finally moved onto building larger sets of contracts.

Note: I have intentionally included build files incase I want to check the generated ABI's. <code>npm install</code> is required in the root dir to get web3 if wanting to execute the 'ts.js' scripts.

<b>BasicEscrow</b> - Basic escrow contract written to understand the basics of Unit Testing with Truffle and to start learning Solidity. The file ts.js can be commented/uncommented and executed with 'exec ts.js' from the truffle console to play with a deployed Escrow contract. There are basic Unit tests written in Solidity and JS.

<b>CoinFlipper</b> - Random payout gambling contract. Two participants contribute the same amount of Ether and one of them gets it all sent to them. There are two contract implementations, one uses block hashes to determine the winner and one uses Oraclize. They both implement an abstract contract which has the same base functionality. I would like to know how to avoid using an abstract contract and use a library, perhaps that will come next.

The Web3Utils is copied from the BasicEscrow project and updated to be a bit more useful. The truffle.js includes a Rinkeby config as I used the Rinkeby testnet for testing the contract that requires Oraclize. I may experiment with ethereum-bridge to enable testing the Oraclize contract on testrpc. As before there is a ts.js which can be commented in parts and executed in the truffle console to play with the deployed contracts.

<b>Crowdsale</b> - Crowdsale contract where the creator is the beneficiary. Primarily written to understand events and how to test them. The test written to check the event firing doesn't pass consistently. I've asked around and tried to find a solution and will update it once I do. There is a 'ts.js' as before for manual testing purposes.

<b>Voting</b> - Basic Voting contract. It is not anonymous and the current vote tally can be observed at any time. I believe these problems can be fixed with zk-SNARKs but I don't understand them yet. There's no 'ts.js' as I tested in straight from the terminal.

<b>Futarchy (not really Futarchy but similar idea, maybe SchellingVote would be a better name)</b> - Futarchy Vote contract which accepts ERC20 VoteTokens representing votes for or against a decision. The winning vote is put into practice and after a period of time the success of the decision is registered with the contract. People who previously contributed VoteToken's to the correct outcome can claim them back plus VoteTokens contributed to vote for the incorrect outcome proportional to their contribution. There is a 'ts.js' which can be used to test. To test, once contracts are deployed, start by transferring VoteTokens to a couple of accounts, then submitting votes, then if using testrpc a new block needs to be mined to update the 'now' constant in the contract (make a tx or something), then the test period outcome can be registered and winning participants can retrieve their VoteTokens.

<b>Liquid Lockable Vote</b> - Multi-period set of financially incentivised voting contracts with vote-reveal-claim periods. Including an ERC20 lockable vote token which is locked during the reveal period for accounts that have voted until the account reveals their vote. Multiple votes with the same end times can be created and votes cast will lock the vote token accordingly for those accounts. It includes a basic LinkedList and use of libraries. This is a variation of a voting contract inspired by: https://blog.colony.io/towards-better-ethereum-voting-protocols-7e54cb5a0119. It can be tested by executing fvt.js and un/commenting parts of the script. 
