# Solidity-Intermediate Project

_*Aim of the program*_

Write a smart contract that implements the require(), assert() and revert() statements

*Three methods constitute the error-handling process in Solidity:*

1. *Require*- If the condition returns to true then the execution of the program is passed to the next statement else function execution is terminated and the second parameter of the require statement is displayed.
 
 
2. *Assert*- If the condition fails then the program execution is terminated with an error message. It takes only one parameter i.e. the condition. If the condition returns to true then the execution jumps to the next statement.

 
3. *Revert*- It is used to display the error and revert the current call. Since the function execution stops after the revert() statement, the remaining gas is also returned to the user. If you don't use the revert() statement and some error occurs, then the entire gas is lost. 


*Code Logic*

1. In this program, a contract named "ErrorHandling" is made consisting of three functions to define the functioning of the require, assert and revert statement. 

2. These functions are declared using the keyword 'function'. They are made public so that they can be accessed throughout the complete program. The pure keyword ensures that the function does not read or modify the state.

3. The testRequire function takes one unsigned int as its parameter. It consists of require statement with a condition to check whether num1 is smaller than 10. If not that message passed as a second parameter of the require statement is displayed else the execution jumps to the next statement.

4. The testAssert function takes one unsigned int as its parameter. It consists of an assert statement with a condition to check whether num2 is smaller than 10. If the condition returns to true then the execution jumps to the next statement

5. The testRevert function takes one unsigned int as its parameter. It consists of an if statement to check whether num3 is greater than 10. If this condition returns to true then the revert statement reverts the transaction to the initial state and  displays that the number is greater than 10. Else if num3<10 then it is copied to num. 

   
*Code functionality:*

1. Open the Remix IDE.
   
2. Write the above code.
   
3. Compile the code using the solidity compiler at the left menu tab.
   
4. Deploy the code using deploy and run transactions at the left menu tab.
   
5. Put different values of  unsigned integer values and notice the working of the require, assert, and revert statements.
