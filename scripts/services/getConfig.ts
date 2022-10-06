import { compat, types as T } from "../deps.ts";

export const getConfig: T.ExpectedExports.getConfig = compat.getConfig({
  "tor-address": {
    "name": "Tor Address",
    "description": "The Tor address of the network interface",
    "type": "pointer",
    "subtype": "package",
    "package-id": "itchysats",
    "target": "tor-address",
    "interface": "main",
  },
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
  },
  "custom-electrs": {
    "type": "object",
    "name": "Custom Electrs",
    "description": "Switch to a custom Electrum server instance. Be mindful activating this feature. Check the instructions for more information.",
    "spec": {
      "enable-custom-electrs": {
        "name": "Enable Custom Electrs",
        "description": "After enabling this you can specify a custom Electrs URL to be used below",
        "type": "boolean",
        "default": false,
      },
      "electrs-url": {
        "type": "string" as const,
        "name": "Custom Electrs URL",
        "description": "URL to the Electrs instance to be used by ItchySats",
        "nullable": false,
        "default": "ssl://blockstream.info:700",
        "copyable": true,
        "masked": false
      }
    }
  },
});
