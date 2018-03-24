pragma solidity ^0.4.0;

//contract erc20token{
//    function totalSupply() public constant returns(uint);
//    function balanceOf(address tokenOwner) public constant returns(uint);
//    function approve(address spender, uint tokens) public returns(bool);
//    function allowance(address tokenOwner, address spender) public constant returns(uint);
//    function transfer(address to, uint tokens) public returns(bool);
//    function transferFrom(address from, address to, uint tokens) public returns(bool);
//}

contract HomeTask1Contract{
    address owner;
    uint supply;
    mapping(address => uint) public balance;
    mapping(address => mapping(address => uint)) public approve;
    function HomeTask1Contract(uint supply_) public{
        owner = msg.sender;
        balance[msg.sender] = supply_;
        supply = supply_;
    }

    function totalSupply() public constant returns(uint){
        return supply;
    }
    function balanceOf(address tokenOwner) public constant returns(uint){
        return balance[tokenOwner];
    }
    function approve(address spender, uint tokens) public returns(bool){
        require(balance[owner] >= tokens);
        approve[msg.sender][spender] += tokens;
        balance[owner] -= tokens;
        return true;
    }
    function allowance(address tokenOwner, address spender) public constant returns(uint){
        return approve[tokenOwner][spender];
    }
    function transfer(address to, uint tokens) public returns(bool){
        require(msg.sender != address(0));
        require(owner == msg.sender);
        require(balance[owner] >= tokens);
        require(balance[to] + tokens >= balance[to]);
        balance[to] += tokens;
        balance[owner] -= tokens;
        return true;
    }
    function transferFrom(address from, address to, uint tokens) public returns(bool){
        require(approve[from][to] >= tokens);
        require(balance[to] + tokens >= balance[to]);
        approve[from][to] -= tokens;
        return true;
    }
}


