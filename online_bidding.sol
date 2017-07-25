pragma solidity ^0.4.0;
contract Online_Bidding
{
    
    address contract_owner; //stores all the address of the contract owner
    struct Bidder //structure to contain the info about bidder
    {
        address bidder_address;
        uint bid;
        string bidder_name;
    }
    mapping(address=>Bidder) public bidders;
    uint max_bid=0;
    string winning_bidder;
    
    function Online_Bidding()
    {
        contract_owner=msg.sender;
    }
    
    function make_bid(uint _bid,string _bidder)
    {
        
        address bidder=msg.sender;
        if(_bid>max_bid)
        {
            max_bid=_bid;
            winning_bidder=_bidder;
        }
        if(bidders[bidder].bidder_address==0)
        {
            bidders[bidder].bidder_address=bidder;
            bidders[bidder].bid=_bid;
            bidders[bidder].bidder_name=_bidder;
        }
        else
        {   
            bidders[bidder].bid=_bid;
            
        }
    }
    function get_winning_bidder() returns(string)
    {
        return winning_bidder;
    }
    function get_winning_bid_amount() returns(uint)
    {
        return max_bid;
    }
    
}
