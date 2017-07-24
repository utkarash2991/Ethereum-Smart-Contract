pragma solidity ^0.4.0;
contract Voting
{
    address public manager;
    uint candidate_count;
    struct Voter
    {
        address voter_id;
        bool voted;
    }
    struct Candidate
    {
        uint candidate_id;
        string  proposal;    
        uint vote_count;
    }
    struct Candidate_Id_list
    {
        uint candidate_id;
    }
    mapping(address => Voter) public voters;
    mapping(uint => Candidate) public candidate;
    Candidate_Id_list[] public candidate_ids;
    //Voter[] public voters;
    //Candidate[] public candidate;
    function Voting()
    {
        manager=msg.sender;
    }
    function assignVoter(address voter_address)
    {
        if(msg.sender==manager)
        {
            if(voters[voter_address].voter_id==0){
                voters[voter_address].voter_id = voter_address;
                voters[voter_address].voted = false;
            }
        }
    }
    function assignCandidate(string proposal_name, uint candidateId) returns(uint)
    {
        if(msg.sender==manager)
        {
            if(candidate[candidateId].candidate_id==0){
                
                candidate_ids.push(Candidate_Id_list(
                    {
                        candidate_id:candidateId
                    }));
                
                candidate[candidateId].candidate_id=candidateId;
                candidate[candidateId].proposal=proposal_name;
                candidate[candidateId].vote_count=0;
            }
        }
        //return  candidate[candidateId].proposal + string(candidate[candidateId].candidate_id);
        //return  candidate[candidateId].candidate_id;
        return candidate[candidateId].vote_count;
    }
    function castVote(uint candidateId)
    {
        if(!voters[msg.sender].voted)
        {
            voters[msg.sender].voted=true;
            candidate[candidateId].vote_count+=1;
        }
    }
    function getProposal_of_Candidate(uint candidateId) returns(string)
    {
        return  candidate[candidateId].proposal;
    }
    function getWinningCandidate() returns(uint)
    {
        uint winning_vote_count=0;
        uint winning_candidate_id=0;
        for(uint i=0;i<candidate_ids.length;i++)
        {
            if(candidate[candidate_ids[i].candidate_id].vote_count>winning_vote_count)
            {
                winning_vote_count=candidate[candidate_ids[i].candidate_id].vote_count;
                winning_candidate_id=candidate_ids[i].candidate_id;
            }
        }
        return winning_candidate_id;
    }
    
    
}
