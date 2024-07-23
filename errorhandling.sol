//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
contract kiranerrorhandling{
    uint public num;
    function testRequire(uint num1) public pure{
        require(num1<75,"Number is greater than 75, please enter number smaller than 75");
    }
    function testAssert(uint num2) public pure {
        assert(num2<85);
    }
    function testRevert(uint num3) public{
        if(num3>25){
          revert("Number is greater than 25");
        }
        else{
            num=num3;
        }
        
    }
}
