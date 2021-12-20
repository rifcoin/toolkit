// SPDX-License-Identifier: MIT
pragma solidity =0.8.6;

import '@rifcoin/swap/contracts/interfaces/IRifainSwap.sol';

import '../libraries/PoolTicksCounter.sol';

contract PoolTicksCounterTest {
    using PoolTicksCounter for IRifainSwap;

    function countInitializedTicksCrossed(
        IRifainSwap pool,
        int24 tickBefore,
        int24 tickAfter
    ) external view returns (uint32 initializedTicksCrossed) {
        return pool.countInitializedTicksCrossed(tickBefore, tickAfter);
    }
}
