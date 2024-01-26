# Pragati

This is a flutter app to track the expenses.

## Objective

App should be able to read messages and sort the messages that are related to expense.
App should be able to obtain data from the sorted messages such as the amount and date of transaction and categorize them into respective mode of payment.
The obtained data should be presented in the form of graphs and charts so that the user can easily understand where money has been spend

## Implementation

1. Collection of all SMSs received using Telephony package
2. Separation of Expense based messages from the collected messages using regular expression.
3. Parsing of needed information like date and amount spent from SMSs using flutter functionalities.
4. Creating functionalities for User modification of espenses.
5. Rendering of the processed information to the user via UI built using flutter.
