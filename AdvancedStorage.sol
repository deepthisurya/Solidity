pragma solidity ^0.5.0;
contract AdvancedStorage{
    uint[] public ids;
    
    //transaction cost : 47645 gas
    function addID(uint _id) public{
        ids.push(_id);
    }
    
    // transaction cost 23422 gas
    function getID(uint position) view public returns(uint){
        return ids[position];
    }
    
    // transaction cost 22337 gas
    // Why mention memory is because array is complex datatype
    function getAllID() view public returns(uint[] memory){
        return ids;
    }
    
    // transaction cost 22337 gas
    function getLength() view public returns(uint){
        return ids.length;
    }
}
    
