pragma solidity ^0.8.0;

import {FlashLoanSimpleReceiverBase} from "./aave/FlashloanSimpleReceiverBase.sol";
import { SafeMath } from '../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol';

import "../interfaces/IPool.sol";
import "../interfaces/IPoolAddressesProvider.sol";
import "../interfaces/Withdrawable.sol";

contract simpleFlashLoan is FlashLoanSimpleReceiverBase, Withdrawable {

    using SafeMath for uint256;

    //address asset = 0xc2132D05D31c914a87C6611C10748AEb04B58e8F;
    //uint256 amount = 0.1 ether;
    bytes params = "";
    uint16 referralCode = 0;

    constructor(IPoolAddressesProvider _addressProvider) FlashLoanSimpleReceiverBase(_addressProvider) {}
    //IPool POOL = IPoolAddressesProvider.getPool();
    //lendingPool.flashLoan(address(this), asset, amount, params);

    function executeOperation(
        address asset, 
        uint amount, 
        uint premium, 
        address initiator, 
        bytes calldata params
        ) 
        external 
        returns(bool)  
        {
         //************************ */    
         //FLASHLOAN CUSTOM LOGIC HERE
        //************************ */
        
        // Approve the LendingPool contract allowance to *pull* the owed amount
        uint amountOwing = amount.add(premium);
        IERC20(asset).approve(address(POOL), amountOwing);
    }

    function _flashLoanSimple(address asset, uint256 amount) internal {
        
        POOL.flashLoanSimple(
            address(this), 
            asset, 
            amount, 
            params, 
            referralCode)
            ;
    }

    function flashloan(address asset, uint amount) public onlyOwner {
        //address asset = 0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE;
        //uint amount = 1 ether;
        
        _flashLoanSimple(asset, amount);
    }
    
} 
