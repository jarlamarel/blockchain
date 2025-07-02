// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract EES {
    string public schoolName;
    string public typeOfSchool;
    string public country;
    address public schoolAddress;
    string public website;
    uint256 public agentID;

    constructor(string memory _schoolName, string memory _type, string  memory _country, address _address, string memory _website, uint256 _agentID){
        schoolName = _schoolName;
        typeOfSchool = _type;
        country = _country;
        schoolAddress = _address;
        website = _website;
        agentID = _agentID;
    }

    function changeSchoolName(string memory _schoolName) private {
        schoolName = _schoolName;
    }   

    function changeType(string memory _type) private {
         typeOfSchool = _type; 
    }

    function changeWebsite(string memory _website) private {
         website = _website; 
    }
}
