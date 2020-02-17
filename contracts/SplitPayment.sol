pragma solidity >=0.4.22 <0.7.0;

contract SplitPayment {
    address public owner;
    
    constructor(address _owner) public {
        owner = _owner;
    }
    
    function send(
        address payable[] memory to, uint[] memory amount)
        payable
        onlyOwner()
        public
        {
            require(to.length == amount.length, 
                'to and amount array must have same length!');
            for(uint i; i < to.length; i++) {
                to[i].transfer(amount[i]);
            }
        }
        
    modifier onlyOwner() {
        require(msg.sender == owner,
            'Only owner can send transfers!');
        _;
    }
}
