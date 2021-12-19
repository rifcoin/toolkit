# rifcoin toolkit

[![Tests](https://github.com/rifcoin/toolkit/workflows/Tests/badge.svg)](https://github.com/rifcoin/toolkit/actions?query=workflow%3ATests)
[![Lint](https://github.com/rifcoin/toolkit/workflows/Lint/badge.svg)](https://github.com/rifcoin/toolkit/actions?query=workflow%3ALint)

This repository contains the periphery smart contracts for the Rifcoin Swap Protocol.
For the lower level core contracts, see the [swap](https://github.com/rifcoin/swap)
repository.

## Local deployment

In order to deploy this code to a local testnet, you should install the npm package
`@rifcoin/toolkit`
and import bytecode imported from artifacts located at
`@rifcoin/toolkit/artifacts/contracts/*/*.json`.
For example:

```typescript
import {
  abi as SWAP_ROUTER_ABI,
  bytecode as SWAP_ROUTER_BYTECODE,
} from '@rifcoin/toolkit/artifacts/contracts/SwapRouter.sol/SwapRouter.json'

// deploy the bytecode
```

This will ensure that you are testing against the same bytecode that is deployed to
mainnet and public testnets, and all Uniswap code will correctly interoperate with
your local deployment.

## Using solidity interfaces

The rifcoin toolkit interfaces are available for import into solidity smart contracts
via the npm artifact `@rifcoin/toolkit`, e.g.:

```solidity
import '@rifcoin/toolkit/contracts/interfaces/ISwapRouter.sol';

contract MyContract {
  ISwapRouter router;

  function doSomethingWithSwapRouter() {
    // router.exactInput(...);
  }
}

```
