from brownie import simpleFlashLoan, accounts, config, network, interface
DECIMALS = 1000000000000000000
MINIMUM_flashloan_contract_WMATIC_BALANCE = 0.2 * DECIMALS
POLYGONSCAN_TX_URL = "https://polygonscan.com/tx/{}"


def main():
    """
    Executes the func of the flash loan.
    """
    acct = accounts.add(config["wallets"]["from_key"])
    print("Getting flashloan_contract contract...")
    flashloan_contract = simpleFlashLoan[len(simpleFlashLoan) - 1]
    print(flashloan_contract)

    wmatic = interface.WmaticInterface(config["networks"][network.show_active()]["wmatic"])
    matic = interface.WmaticInterface(config["networks"][network.show_active()]["matic"])
    dai = interface.WmaticInterface(config["networks"][network.show_active()]["dai"])

    # We need to fund it if it doesn't have any token to fund!
    if wmatic.balanceOf(flashloan_contract) < MINIMUM_flashloan_contract_WMATIC_BALANCE:
        print("Funding flashloan_contract contract with WMATIC...")
        wmatic.transfer(flashloan_contract, MINIMUM_flashloan_contract_WMATIC_BALANCE, {"from": acct})

    print("Executing flashloan_contract...")
    tx = flashloan_contract.flashloan(wmatic, int(5 * DECIMALS),  {"from": acct})
    print("You did it! View your tx here: " + POLYGONSCAN_TX_URL.format(tx.txid))
    return flashloan_contract
