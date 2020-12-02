# Bank Tech Test

An application to model a bank for the Makers Bank mock Tech Test.

Features:
 - REPL application - run in IRB.
 - Deposits
 - Withdrawals 
 - Printed summary

 ## Use

 ```shell
git clone https://github.com/dan-holmes/bank-tech-test.git
cd bank-tech-test
irb -r "./lib/account.rb"
account = Account.new
account.deposit(1000)
account.withdraw(500)
Printer.summary(account.transactions)
 ```

Optionally add a date to a transaction with:

```shell
date = Date.new(2020, 11, 1)
account.deposit(1000, date: date)
```

Run tests and see test coverage with:

```shell
rspec
```

Test coverage is currently 100%.

![Test coverage](https://i.imgur.com/9Divn3G.png)

## Planning

### User stories

As a customer
So that I can save money
I want to be able to desposit

As a customer
So that I can get my money back
I want to be able to withdraw

As a customer
So that I can keep track of my finances
I want to see a printed statement of my account history

### Domain Model Diagram

![Domain Model Diagram](https://i.imgur.com/peHaEJb.png)

Note: ``transaction.type`` has been replaced by ``transaction.debit`` and ``transaction.credit``.

### Input/Output

#### Input
```
account = Account.new
date = Date.new(2012, 1, 13)
account.deposit(2000, date)
date = Date.new(2012, 1, 14)
account.withdraw(500, date)
account.statement
```

#### Output

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Edge cases

| Edge case | Expected output |
|-----------|-----------------|
| withdraw/deposit < 0 | Negative withdrawel counted as a deposit and visa versa|
| withdraw/deposit 0 | Error: You must enter a non-zero amount.|
| withdraw more than balance | Error: Insufficient funds for transaction.| 
| withdraw/desposit not a number | Error: Input must be a number. |
| withdraw/deposit without a given date | Default to today's date |
| withdrawal/deposit fraction of penny | Error: You can't deposit/withdraw a fraction of a penny. |
