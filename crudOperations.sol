pragma solidity ^0.5.0;

contract CrudContract{
    
    struct User{
        uint userID;
        string userName;
    }
    
    User[] public users;
    uint public nextID=0;
    
     // transaction cost 87473 gas execution cost 65241 gas
    function createUser(string memory name) public{
        users.push(User(nextID,name));
        nextID++;
    }
    
     // transaction cost 28236 gas but this is read only so no gas spent here
    function readUser(uint index) view public returns(string memory){
        uint position = findByIndex(index);
        return(users[position].userName);
    }
    
     // transaction cost 33510 gas execution cost 11214 gas
    function updateUser(uint index, string memory name) public {
        uint position = findByIndex(index);
        users[position].userName = name;
    }
     // transaction cost 23284 gas , execution cost : 25104
    function deleteUser(uint index) public {
        uint position = findByIndex(index);
        delete users[position];
    }
     // transaction cost
    function findByIndex(uint id) view internal returns(uint position){
        for(uint i=0;i<users.length;i++){
            if(users[i].userID==id){
                return(i);
            }
            //updates non exisiting field with the default of its type
        }
        // if the user with the index in not found in the array then use revert function to terminate the smart contract
        // The program stops and all the gas spent till now is not returned.
        revert("No entry at the given index!!!");
    }
}
