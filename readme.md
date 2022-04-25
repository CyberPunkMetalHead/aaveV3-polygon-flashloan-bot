# What does it do?
The Aave-Polygon flashloan bot attempts to identify and exploit arbitrage opportunities by flashloaning large amounts of stablecoins to take advantage of the change in price between different stablecoins.

### Install Brownie Eth

`pip install eth-brownie`

### Configure the Polygon Network
`brownie networks add Polygon polygon_main_infura host=INFURA_URL chainid=137 name=Polygon Main (Infura)`

### Add your Infura Key and Private Matic Key to the .env (create Infura Account)
You will need to create an account on https://infura.io/

### Deploy contract
`brownie run scrips/deploy.py`

### Run flashloan on contract
`brownie run scrips/run_flashloan.py`

### Some Considerations
Right now the contract deployment does not seem to be able to return a gas fee calculation and the transaction gets reverted. I haven't been able to debug this yet but I suspect there may be a silent error in the code.   

The amounts and contract address for the loan are currently hardcoded in the simpleFlashloan.sol file.  

The contract is configured to deploy on Polygon Mainnet, but you should be able to just add a Testnet to Infura, copy the new URL, and add it to the .env file.
Go to the brownie-config.yml file, find the polygon_main_infura setting, and change the AAVE Pool contract to: 0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6.  

### Additional Resources
AAVE V3 Testnet Contracts https://docs.aave.com/developers/deployed-contracts/v3-testnet-addresses
AAVE V3 Mainnet Contracts Polygon: https://docs.aave.com/developers/deployed-contracts/v3-mainnet/polygon
Fund your Testnet wallet with Test Matic: https://faucet.polygon.technology/
AAVE V3 repo: https://github.com/aave/aave-v3-core
