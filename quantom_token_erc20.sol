// SPDX-License-Identifier: MIT
//
// Web: quantumleap.gg
// Discord: discord.gg/Jt8N9hjDNq
// Twitter: https://twitter.com/xQuantum_Leap

pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract Quantum is ERC20, Ownable {
    constructor() ERC20("Quantum", "QLT") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }
}
