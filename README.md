# Bank Tech Test

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

### Input/Output

#### Input
```
account = Account.new
account.deposit(2000, '2012-01-13')
account.withdraw(500, '2012-01-14')
account.statement
```

#### Output

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```