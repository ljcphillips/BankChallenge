# BankChallenge
Bank Tech Test for Makers

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
### Approach

I started off by drawing a Domain Model. 
  
The next step was environment set up. I created a Gem file and added the rspec, rubocop and simplecov gems to help me test my code.
 
I decided to use test driven development and so wrote tests before actually writing any code. 

I ended up with a solution which met the requirements and acceptance criteria and started looking at refactoring.

After discussion with a coach, I decided to add some additional functionality and followed this up with further refactoring.

### Code Structure

I initially decided on having two classes, Bank Account and Transaction. The Bank Accoutn Class would hold the balance and statement information as well as print them. The Transaction would handle the methods that changed the balance. 

I decided to get rid of the Transaction Class and added in a Statement and Interface Class instead.

The Interface Class was created to provide an easy way for the user to interact with the Bank Accounts and Statements.

I added in a module for my Printing methods.

### Install and Run Code and Tests

This is a command line app and you will need to run it in a REPL such as irb. 
If you don't already have it you will need bundler.
Clone or Fork this repo to your directory. 
Navigate to your directory in your terminal(command line).
Run Bundle Install.
To test enter 'rspec' into your terminal.
To run code, open irb from the lib folder in the Bank Challenge Folder.
require './interface.rb'
Instantiate a new Interface 
interface = Interface.new
Add a new Bank Account to the Interface and give it a reference number
interface.new_account(:reference => 1)
Select the Bank Account using its reference number
interface.select_account(1)
You can now:
  Deposit Money: interface.deposit(100)
  Withdraw Money: interface.withdraw(50)
  Print Balance: interface.print_balance
  Print Statement: interface.print_statement







