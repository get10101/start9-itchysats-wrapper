import { compat, types as T } from "../deps.ts";

export const getConfig: T.ExpectedExports.getConfig = compat.getConfig({
  // "tor-address": {
  //   "name": "Tor Address",
  //   "description": "The Tor address of the network interface",
  //   "type": "pointer",
  //   "subtype": "package",
  //   "package-id": "itchtysats",
  //   "target": "tor-address",
  //   "interface": "main",
  // },
  "enable-electrs": {
    "name": "Enable Electrs",
    "description": "Enables using the Electrs app",
    "type": "boolean",
    "default": true,
  },
});
