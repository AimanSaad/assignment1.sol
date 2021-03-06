
pragma solidity ^ 0.8.0;

// contract definition
contract enrollment {

// state variables
    address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    Student[] info = [Student("Amna", 1,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,true,true), Student("Sara", 2,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, true,false)];
    uint myBalance = address(this).balance;
// modifier declaration
   modifier onlyBy() {
        if (msg.sender == owner) {
            _;
        }
    } 

// struct definition
    struct Student {
        string name;
        uint enrollno;
        address ethAdd;
        bool hasBSdegree;
        bool isFeePaid;
    } 
    
    //enum declaration
        enum gender {female,male}
        enum studyMode {onsite,online}
        
        event newEnrollment(string, uint, address);
    
    //function definition
    function checkBalance() onlyBy() public view returns (uint) {
        return address(this).balance;
    }
    
    //function definition
    function recievePayment() public payable returns (uint) {
        myBalance += msg.value;
        return msg.value;
    }
    mapping (uint => string) records ;
    function retrieveRecord(uint a) public returns (string memory b){
     records [a] = b;
     return b;
    }
         function checkfee(uint fee) public payable {
        if (msg.value < 2 ether)
        revert ("not enough amount to enroll");
        
    }
    


}
