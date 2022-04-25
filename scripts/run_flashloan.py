from brownie import simpleFlashLoan, accounts, config, network, interface

MINIMUM_FLASHLOAN_WETH_BALANCE = 500000000000000000
POLYGONSCAN_TX_URL = "https://polygonscan.com/tx/{}"


def main():
    """
    Executes the func of the flash loan.
    """
    acct = accounts.add(config["wallets"]["from_key"])
    print("Getting Flashloan contract...")
    flashloan = simpleFlashLoan
    aDAI = config["networks"][network.show_active()]["aDAI"]
    print("Executing Flashloan...")
    tx = flashloan.flashloan(aDAI, {"from": acct})
    print("You did it! View your tx here: " + POLYGONSCAN_TX_URL.format(tx.txid))
    return flashloan
