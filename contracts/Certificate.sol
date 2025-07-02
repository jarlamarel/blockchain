// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Certificate {
    string public country;
    string public certificateType;
    string public specialty;
    string public merit;
    uint256 public acquisitionDate;

    string public EES_name;
    uint256 public EES_ID;

    uint256 public holder_ID;

    constructor(string  memory _country, string memory _certificateType, string memory _specialty, string memory _merit, uint256 _acquisitionDate, string memory _EES_name, uint256 _EES_ID, uint256 _holder_ID){
        country = _country;
        certificateType = _certificateType;
        specialty = _specialty;
        merit = _merit;
        acquisitionDate = _acquisitionDate;
        EES_name = _EES_name;
        EES_ID = _EES_ID;
        holder_ID = _holder_ID;
    }
}
