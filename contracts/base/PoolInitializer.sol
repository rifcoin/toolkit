// SPDX-License-Identifier: MIT
pragma solidity =0.8.6;

import '@rifcoin/swap/contracts/interfaces/IRifainSwapFactory.sol';
import '@rifcoin/swap/contracts/interfaces/IRifainSwap.sol';

import './PeripheryImmutableState.sol';
import '../interfaces/IPoolInitializer.sol';

/// @title Creates and initializes V3 Pools
abstract contract PoolInitializer is IPoolInitializer, PeripheryImmutableState {
    /// @inheritdoc IPoolInitializer
    function createAndInitializePoolIfNecessary(
        address token0,
        address token1,
        uint24 fee,
        uint160 sqrtPriceX96
    ) external payable override returns (address pool) {
        require(token0 < token1);
        pool = IRifainSwapFactory(factory).getPool(token0, token1, fee);

        if (pool == address(0)) {
            pool = IRifainSwapFactory(factory).createPool(token0, token1, fee);
            IRifainSwap(pool).initialize(sqrtPriceX96);
        } else {
            (uint160 sqrtPriceX96Existing, , , , , , ) = IRifainSwap(pool).slot0();
            if (sqrtPriceX96Existing == 0) {
                IRifainSwap(pool).initialize(sqrtPriceX96);
            }
        }
    }
}
