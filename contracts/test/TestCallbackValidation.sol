// SPDX-License-Identifier: MIT
pragma solidity =0.8.6;

import '../libraries/CallbackValidation.sol';

contract TestCallbackValidation {
    function verifyCallback(
        address factory,
        address tokenA,
        address tokenB,
        uint24 fee
    ) external view returns (IRifainSwap pool) {
        return CallbackValidation.verifyCallback(factory, tokenA, tokenB, fee);
    }
}
