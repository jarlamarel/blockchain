// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract EES {
    string public name;
    string public sector;
    uint256 public creationDate;
    string public sizeClassification;
    string public country;
    address public companyAddress;
    string public mailAddress;
    string public phoneNumber;
    string public website;

    constructor(string memory _name, string memory _sector, uint256 _creationDate, string memory _sizeClassification, string memory _country, address _companyAddress, string memory _mailAddress, string memory _phoneNumber, string memory _website){
        name = _name;
        sector = _sector;
        creationDate = _creationDate;
        sizeClassification = _sizeClassification;
        country = _country;
        companyAddress = _companyAddress;
        mailAddress = _mailAddress;
        phoneNumber = _phoneNumber;
        website = _website;
    }

    function changeName(string memory _name) private {
        name = _name;
    }   

    function changeSector(string memory _sector) private {
         sector = _sector; 
    }

    function changeSizeClassification(string memory _sizeClassification) private {  
        sizeClassification = _sizeClassification;
    }

    function changeAddress(address _companyAddress) private {
        companyAddress = _companyAddress ;       
    }    

    function changeMailAddress(string memory _mailAddress) private {
        mailAddress = _mailAddress ;
    }

    function changePhoneNumber(string memory _phoneNumber) private {
        phoneNumber = _phoneNumber ;
    }

    function changeWebsite(string memory _website) private {
         website = _website; 
    }
}
