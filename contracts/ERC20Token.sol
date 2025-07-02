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

     function createPayment(
        address _recipient,
        uint256 _amount,
        string memory _description
    ) external returns (uint256) {
        require(_recipient != address(0), "Invalid recipient");
        require(_amount > 0, "Balance should be over 0");
        require(bytes(_description).length > 0, "Description required");
        
        uint256 paymentID = nextPaymentID;
        nextPaymentID++;
        
        payments[paymentID] = Payment({
            payer: msg.sender,
            recipient: _recipient,
            amount: _amount,
            description: _description,
            isPaid: false,
            timestamp: block.timestamp
        });
        
        userPayments[msg.sender].push(paymentID);
        userPayments[_recipient].push(paymentID);
        
        emit PaymentCreated(paymentID, msg.sender, _recipient, _amount, _description);
        
        return paymentID;
    }

    function executePayment(uint256 _paymentID) 
        external 
        validPaymentID(_paymentID)
        nonReentrant 
    {
        Payment storage payment = payments[_paymentID];
        
        require(!payment.isPaid, "Payment already done");
        require(msg.sender == payment.payer, "Only the payer can do this action");
        
        require(
            paymentToken.balanceOf(msg.sender) >= payment.amount,
            "Balance too low"
        );
        
        require(
            paymentToken.allowance(msg.sender, address(this)) >= payment.amount,
            "Insufficient allowance"
        );
        
        payment.isPaid = true;
        
        bool success = paymentToken.transferFrom(
            msg.sender,
            payment.recipient,
            payment.amount
        );
        
        require(success, "Transfet failure");
        
        emit PaymentExecuted(_paymentID, msg.sender, payment.recipient, payment.amount);
    }

    function cancelPayment(uint256 _paymentID) 
        external 
        validPaymentID(_paymentID)
        onlyPayerOrRecipient(_paymentID)
    {
        Payment storage payment = payments[_paymentID];
        require(!payment.isPaid, "Can't cancel already done payments.");
        
        payment.amount = 0;
        
        emit PaymentCancelled(_paymentID);
    }
}