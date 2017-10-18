pragma solidity ^0.4.14;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './BurnableToken.sol';

contract TransmuteAgent is Ownable {

    /**
    * This contract handles the ethereum 
    * part of transmuting the EIP 20 token 
    * into Health Cash on Health Nexus
    */

    BurnableToken public token;
    bool public enabled = false;
    uint public transmuteNonce = 0; 

    /**
    Used to allocate Health Cash on Health Nexus,
    required a valid Health Nexus address
    */
    event Transmute(address indexed _from, address indexed _to, uint _value, bytes32 _id);

    /*
    * Tokens can not be transmuted without 
    * first authorizing the TransmuteAgent contract
    * explicitly. 
    */
    modifier isAuthorizedToSpend(uint _value) {
        assert(authorizedToSpend() >= _value); 
        _;
    }
    function authorizedToSpend() public constant returns (uint) {
        return token.allowance(msg.sender, address(this)); 
    }

    /**
    * Cross-chain transmution burns the original
    * HLTH token. 
    */
    function transmuteToken(address _to, uint _value) 
    public
    isAuthorizedToSpend(_value)
    {
        require(enabled);

        //first transfer tokens to this contract
        assert(token.transferFrom(msg.sender, address(this), _value));        
        
        //burn the tokens
        token.burn(_value);
        transmuteNonce ++;
        bytes32 id = keccak256(now,transmuteNonce,_to);

        //make a record used to allocate on Health Nexus
        Transmute(msg.sender, _to, _value, id);
    }

    /**
    * [Admin Only]
    * set the token contract we are going to transmute from
    */   
    function setTokenToTransmute(BurnableToken _token) 
    onlyOwner 
    {
        token = _token;
    }

    /**
    * [Admin Only]
    * enable/disable 
    */
    function enable(bool _enabled) 
    onlyOwner 
    {
        enabled = _enabled;
    }

}