// SPDX-License-Identifier: MIT
//
// Web: quantumleap.gg
// Discord: discord.gg/Jt8N9hjDNq
// Twitter: https://twitter.com/xQuantum_Leap

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract QuantumToken is ERC20, Ownable {

    address public treasury;
    uint256 public transactionFeePercentage = 5; 

    constructor(string memory name, string memory symbol, uint8 decimals, uint256 totalSupply) ERC20(name, symbol) {
        _mint(msg.sender, totalSupply);
        treasury = 0x265642e14424236b4848c61Bff2F631B1EFDeE84;
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        uint256 fee = calculateTransactionFee(amount);
        uint256 valueAfterFee = amount - fee;
        _transfer(msg.sender, recipient, valueAfterFee);
        _transfer(msg.sender, treasury, fee);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        uint256 fee = calculateTransactionFee(amount);
        uint256 valueAfterFee = amount - fee;
        _transfer(sender, recipient, valueAfterFee);
        _transfer(sender, treasury, fee);
        _approve(sender, msg.sender, allowance(sender, msg.sender) - amount + valueAfterFee);
        return true;
    }

    function calculateTransactionFee(uint256 amount) internal view returns (uint256) {
        return (amount * transactionFeePercentage) / 100;
    }
}
