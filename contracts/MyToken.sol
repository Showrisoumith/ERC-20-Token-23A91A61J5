// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    // Token metadata - UNCOMMENTED!
    string public constant name = "MyToken";    
    string public constant symbol = "MTK";    
    uint8 public constant decimals = 18;    
    uint256 public totalSupply;        

    // Mapping to track balances: address => balance - UNCOMMENTED!
    mapping(address => uint256) public balanceOf;        

    // Nested mapping for allowances: owner => (spender => amount) - UNCOMMENTED!
    mapping(address => mapping(address => uint256)) public allowance;
    
    // Events (Must be defined before being used in the constructor)
    event Transfer(address indexed from, address indexed to, uint256 value);
    // ... (include Approval event here too)
    
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Constructor (Now correctly uses the defined variable 'balanceOf')
    constructor(uint256 _totalSupply) {
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply; // <-- 'balanceOf' is now declared!
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
    // ... rest of the functions
    function transfer(address _to, uint256 _value) public returns (bool success) {
    // 1. Validate that recipient is not zero address
    require(_to != address(0), "MTK: Cannot transfer to zero address");
    
    // 2. Validate sender has sufficient balance
    require(balanceOf[msg.sender] >= _value, "MTK: Insufficient balance");
    
    // 3. Subtract from sender's balance and add to recipient's balance
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    
    // 4. Emit Transfer event
    emit Transfer(msg.sender, _to, _value);
    
    return true;
   }


   function approve(address _spender, uint256 _value) public returns (bool success) {
    // 1. Validate spender is not zero address
    require(_spender != address(0), "MTK: Cannot approve zero address");
    
    // 2. Set allowance for spender (State Change)
    // Owner (msg.sender) grants spender (_spender) the right to spend up to _value.
    allowance[msg.sender][_spender] = _value;
    
    // 3. Emit Approval event
    emit Approval(msg.sender, _spender, _value);
    
    return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    // 1. Validation Checks
    require(_to != address(0), "MTK: Cannot transfer to zero address");
    require(balanceOf[_from] >= _value, "MTK: Insufficient balance");
    require(allowance[_from][msg.sender] >= _value, "MTK: Insufficient allowance");
    
    // 2. State Changes
    // Decrease the allowance for the spender (msg.sender)
    allowance[_from][msg.sender] -= _value;
    
    // Move tokens from owner (_from) to recipient (_to)
    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;
    
    // 3. Emit Transfer event
    emit Transfer(_from, _to, _value);
    
    return true;
    }
    
    // Function to get token information as a single call
    function getTokenInfo() public view returns (string memory, string memory, uint8, uint256) {
    return (name, symbol, decimals, totalSupply);
    }

}
