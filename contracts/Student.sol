// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Student {
    string public surname;
    string public firstname;
    uint256 public dateOfBirth;
    string public sex;
    string public nationality;
    string public civilStatus;
    address public residenceAddress;
    string public mailAddress;
    string public phoneNumber;
    string public section;
    string public finalYearProject_subject;
    string public courseSupervisorName;
    uint256 public internshipStartDate;
    uint256 public internshipEndDate;
    string public assessment;

    uint256 public internshipCompany_ID;

    constructor(string memory _surname, string memory _firstname, uint256 _dateOfBirth, string memory _sex, string memory _nationality, address _residenceAddress, string memory _mailAddress, string memory _phoneNumber, string memory _section){
        surname = _surname;
        firstname = _firstname;
        dateOfBirth = _dateOfBirth;
        sex = _sex;
        nationality = _nationality;
        residenceAddress = _residenceAddress;
        mailAddress = _mailAddress;
        phoneNumber = _phoneNumber;
        section = _section;  
    }

    function changeSurname(string memory _surname) private {
        surname = _surname;
    }   

    function changeFirstname(string memory _firstName) private {
         firstname = _firstName; 
    }

    function changeSex(string memory _sex) private {
         sex = _sex; 
    }

    function changeNationality(string memory _nationality) private {
        nationality = _nationality;     
    }

    function changeCivilStatus(string memory _civilStatus) private {
        civilStatus = _civilStatus ;
    }

    function changeAddress(address _residenceAddress) private {
        residenceAddress = _residenceAddress; 
    }

    function changeMailAddress(string memory _mailAddress) private {
        mailAddress = _mailAddress ;
    } 

    function changePhoneNumber(string memory _phoneNumber) private {
        phoneNumber = _phoneNumber;
    }

    function setFinalYearProject_subject(string memory _finalYearProject_subject ) private {
        finalYearProject_subject= _finalYearProject_subject ;       
    }

    function setCourseSupervisorName(string memory _courseSupervisorName) private {
        courseSupervisorName = _courseSupervisorName;
    }

    function setInternshipStartDate(uint256 _internshipStartDate) private {
        internshipStartDate=_internshipStartDate ;       
    } 

    function setInternshipEndDate(uint256 _internshipEndDate ) private {
       internshipEndDate = _internshipEndDate;
    }
    
    function setAssessment(string memory _assessment) private {
        assessment=_assessment ;       
    }

    function setInternshipCompany_ID(uint256 _internshipCompany_ID) private {
        internshipCompany_ID = _internshipCompany_ID;
    }
}
