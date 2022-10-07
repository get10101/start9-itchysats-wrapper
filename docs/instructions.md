# Configuration

ItchySats on the Embassy requires a fully synced Electrs node as a source for blockchain data. This requirement will be automatically enforced by EmbassyOS.
The password can be found in the `Properties` section.

## Custom Electrs in case of issues with Electrs

In case you run into problems with your Electrs setup (e.g. you have to re-index because of a problem) it is possible to switch ItchySats to use a custom Electrs URL in the config.
Be mindful when using this feature because you are not fully self-sovereign when using a public Electrs instance.
Note that using a public Electrs instance doesn't pose a risk for your keys being stolen, but you won't have full privacy anymore.
You should always prefer to use your embassy's Electrs instance and only activate a custom URL temporarily in case of issues.

# ItchySats

ItchySats enables peer-2-peer CFD trading on Bitcoin using DLCs (discreet log contracts). No account needed, no trusted third-party - just you and your keys.

This is beta software. We test it on testnet and mainnet, but there are no guarantees that it will always behave as expected.
Please be mindful with how much money you trust the application with.

CFDs trading is inherently risky, be sure to read up on it before using this application.

That said: This is pretty awesome, go nuts!

1. Fund the ItchySats wallet
2. Open a position
3. Monitor the price movement
4. Profit
