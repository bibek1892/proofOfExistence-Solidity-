     pragma solidity 0.6.12;

contract CityPoll {
    
    struct City{
        
        string cityName;
        uint256 vote;
    }
    
    mapping(uint256 => City ) cities;
    mapping(address => bool) hasVoted;
    
    
    address owner;
    
    
    uint256 public counter=0;
    
    
    constructor() public {
        
        owner=msg.sender;
        
    }
    
    
    function addCity(string memory  _cityName) public{
        
        require(owner == msg.sender,"only owner can execute this contract");
        
        counter++;
        cities[counter].cityName = _cityName;
        cities[counter].vote = 0;
        
        
    }
    
    function vote(uint256 _id) public{
        
        require (!hasVoted[msg.sender]," You can only vote once.Caller has already voted !!");
        
        cities[_id].vote++;
        hasVoted[msg.sender] = true;    
        
    }
    
    function getCity(uint256 _id) public view returns(string memory ){
        
        return cities[_id].cityName;
        
        
        
        
    }
    
    function getVote(uint256 _id) public view returns(uint256){
        
        return cities[_id].vote;
        
        
    }
    

    
}
