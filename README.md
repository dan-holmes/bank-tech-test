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
| withdraw/deposit 0 | Error: You must withdraw/deposit a positive amount of money.|
| withdraw more than balance | Error: You don't have enough money in your account.| 
| withdraw/desposit not a number | Error: Input must be a number. |
| withdraw/deposit without a given date | Default to today's date |
| withdrawal/deposit fraction of penny | Store as float and round on summary |