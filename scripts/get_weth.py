from brownie import accounts, config, network, interface
DECIMALS = 1000000000000000000
MINIMUM_flashloan_contract_WMATIC_BALANCE = 0.2 * DECIMALS


def main():
    """
    Runs the get_weth function to get WETH
    """
    get_wmatic()


def get_wmatic():
    """
    Mints WETH by depositing MATIC.
    """
    acct = accounts.add(
        config["wallets"]["from_key"]
    )  # add your keystore ID as an argument to this call
    weth = interface.WmaticInterface(config["networks"][network.show_active()]["wmatic"])
    tx = weth.deposit({"from": acct, "value": 0.4 *DECIMALS})
    print("Received 1 WMMATIC")
    return tx
