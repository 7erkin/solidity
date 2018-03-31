pragma solidity ^0.4.0;

library MyActionLibrary{
    function add(uint a, uint b) pure internal returns(uint){
        uint c = a + b;
        assert(c >= a);
        return c;
    }
    function mul(uint a, uint b) pure internal returns(uint){
        uint c = a * b;
        assert(a == 0 || (c / a) == b);
        return c;
    }
    function sub(uint a, uint b) pure internal returns(uint){
        assert(a >= b);
        return a - b;
    }
    function div(uint a, uint b) pure internal returns(uint){
        uint c = a / b;
        assert(b > 0 && a == b * c);
        return c;
    }
}
contract Ownable{
    address public owner;
    function Ownable () public{
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(owner == msg.sender);
        _;
    }
    function transferOwnership(address _newOwner) onlyOwner public{
        require(_newOwner != address(0));
        owner = _newOwner;
    }
}
contract ERC20token{
    using MyActionLibrary for uint;
    uint public totalSupply;
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowed;
    function ERC20token(uint _totalSupply) public{
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply;
    }
    function transfer(address _spender, uint _amount) public{
        require(_spender != address(0));
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_spender] = balances[_spender].add(_amount);
    }
    function transferFrom(address _tokenOwner, address _spender, uint _amount) public{
        require(_spender != address(0));
        allowed[_tokenOwner][_spender] = allowed[_tokenOwner][_spender].sub(_amount);
        balances[_spender] = balances[_spender].add(_amount);
    }
    function balanceOf(address _tokenOwner) public view returns(uint){
        return balances[_tokenOwner];
    }
    function approve(address _spender, uint _amount) public{
        require(_spender != address(0));
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_amount);
    }
    function allowance(address _tokenOwner, address _spender) view public returns(uint){
        return allowed[_tokenOwner][_spender];
    }
}
contract MyMintableToken is ERC20token, Ownable{
    using MyActionLibrary for uint;
    function MyMintableToken(uint _totalSupply) 
    ERC20token(_totalSupply) 
    Ownable()
    public{

    }
    function mint(uint _amount) onlyOwner public{
        balances[owner] = balances[owner].add(_amount);
        totalSupply = totalSupply.add(_amount);
    }
}
