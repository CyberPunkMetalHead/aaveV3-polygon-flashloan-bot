// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.10;

import {IFlashLoanSimpleReceiver} from '../../interfaces/IFlashLoanSimpleReceiver.sol';
import {IPoolAddressesProvider} from '../../interfaces/IPoolAddressesProvider.sol';
import {IPool} from '../../interfaces/IPool.sol';

import { SafeMath } from '../../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol';
import { IERC20 } from '../../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol';
import { SafeERC20 } from '../../node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';


/**
 * @title FlashLoanSimpleReceiverBase
 * @author Aave
 * @notice Base contract to develop a flashloan-receiver contract.
 */
abstract contract FlashLoanSimpleReceiverBase is IFlashLoanSimpleReceiver {
  using SafeERC20 for IERC20;
  using SafeMath for uint256;

  IPoolAddressesProvider public immutable ADDRESSES_PROVIDER;
  IPool public immutable POOL;

  constructor(IPoolAddressesProvider provider) {
    ADDRESSES_PROVIDER = provider;
    POOL = IPool(provider.getPool());
  }
}