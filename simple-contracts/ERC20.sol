// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface IERC20 {
    // The total amount of this ERC20 token
    function totalSupply() external view returns (uint);

    // The amount of ERC20 token that this account have
    function balanceOf(address account) external view returns (uint);

    // The owner transfer ERC20 token to this recipient
    function transfer(address recipient, uint amount) external returns (bool);

    // The amount of ERC20 token for spender to receive
    function allowance(address owner, address spender) external view returns (uint);

    // To allow other spender to transfer owner ERC20 token to this spender
    function approve(address spender, uint amount) external returns (bool);

    // Transfer ERC20 token from recipient to sender after approve
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);
   
    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);
}

contract ERC20 is IERC20 {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    
    string public name = "Test";
    string public symbol = "TEST";
    uint8 public decimals = 18;

    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint amount) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;

        // address(0) set the address to zero
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}