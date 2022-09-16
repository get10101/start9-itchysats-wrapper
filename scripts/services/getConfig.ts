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
  "password": {
    "type": "string" as const,
    "nullable": false,
    "name": "ItchySats Password",
    "description": "The password for ItchySats.",
    "default": {
      "charset": "a-z,A-Z,0-9",
      "len": 22
    },
    "pattern": '^[^\\n"]*$',
    "pattern-description":
        "Must not contain newline or quote characters.",
    "copyable": true,
    "masked": true
  }
});
