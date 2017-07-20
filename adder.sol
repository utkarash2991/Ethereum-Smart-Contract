pragma solidity ^0.4.0;
contract adder
{
    int a;
    int b;
    
    function adder(int _a,int _b) public
    {
        a=_a;
        b=_b;
    }
    function set_a(int _a)  public
    {
        a=_a;
    }
    
    function set_a_with_constant(int _a) constant public ///due to constant we are not able to update the value of a.
    {
        a=_a;
    }
    function set_b(int _b) public
    {
        b=_b;
    }
    function getSum() constant returns(int)
    {
        return (a+b);
    }
    
    function calculateProof(string document) constant returns (bytes32)
    {
    return sha256(document);
    }
    
    
}
