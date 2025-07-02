// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract ERC20Token is Ownable, ReentrancyGuard {
    IERC20 public paymentToken;

    struct Payment {
        address payer;
        address recipient;
        uint256 amount;
        string description;
        bool isPaid;
        uint256 timestamp;
    }

    mapping(uint256 => Payment) public payments;

    uint256 public nextPaymentID;

    mapping(address => uint256[]) public userPayments;

    event PaymentCreated(
        uint256 indexed paymentID,
        address indexed payer,
        address indexed recipient,
        uint256 amount,
        string description
    );

    event PaymentExecuted(
        uint256 indexed paymentID,
        address indexed payer,
        address indexed recipient,
        uint256 amount
    );

    event PaymentCancelled(uint256 indexed paymentID);

    modifier validPaymentID(uint256 _paymentID) {
        require(_paymentID < nextPaymentID, "Invalid payment ID");
        _;
    }

    modifier onlyPayerOrRecipient(uint256 _paymentId) {
        Payment memory payment = payments[_paymentId];
        require(
            msg.sender == payment.payer || msg.sender == payment.recipient,
            "Only the payer or the recipient can do this action."
        );
        _;
    }

    constructor(address _paymentToken) Ownable(msg.sender) {
        require(_paymentToken != address(0), "Invalid token address");
        paymentToken = IERC20(_paymentToken);
        nextPaymentID = 1;
    }
}