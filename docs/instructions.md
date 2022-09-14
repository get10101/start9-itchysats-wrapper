# ItchySats

ItchySats enables peer-2-peer CFD trading on Bitcoin using DLCs
(discreet log contracts). No account needed, no trusted third-party - just you
and your keys.

This is beta software. We tested it on test- and mainnet, but there are no guarantees that it will always behave as expected.
Please be mindful with how much money you trust the application with.

CFDs trading is inherently risky, be sure to read up on it before using this application.

That said: This is pretty awesome, go nuts!

1. Fund the ItchySats wallet
2. Open a position
3. Monitor the price movement
4. Profit


Limitations of the mainnet beta:

1. Minimum position quantity is $100, maximum $1000

- With 0.4.0 your CFDs are perpetual positions that are extended hourly. This means your CFD position will remain open forever unless you decide to close it. A funding fee is collected hourly when the CFD is extended.
- With 0.4.8 you can open long and short positions, previously only long positions were possible.
- With 0.5.0 you can choose from different from leverage. Leverage choices are configured by the maker and might initially be restricted to x1, x2 and x3.
- With 0.6.0 you can open positions on BTCUSD and ETHUSD prices. #ShortTheMerge

# Configuration

ItchySats on the Embassy requires a fully synced Electrum (electrs) node as a source for blockchain data. This requirement will be automatically enforced by EmbassyOS.