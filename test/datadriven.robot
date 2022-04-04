*** Settings ***
Resource                      ../resources/common.robot
Library                       QForce
Library                       DataDriver    reader_class=TestDataApi    name=NewAccounts.csv
Suite Setup                   Setup Browser
Suite Teardown                End suite
Test Template                 Entering Accounts


*** Test Cases ***
Entering Accounts with ${Account_Name} ${Account_status} ${Phone} ${Type} ${Industry}

*** Keywords ***
Entering Accounts
    [Arguments]    ${Account_Name}    ${Account_Status}    ${Phone}    ${Type}    ${Industry}
    [Documentation]        Enters 10 new accounts using a .csv file
    Appstate               Home
    LaunchApp              Sales
    ClickText              Accounts
    ClickText              New
    UseModal               On
    ClickText              Account Name
    TypeText               Account Name    ExampleName
    ClickText              --None--        anchor=Rating
    ClickText              Hot
    ClickText              Phone
    TypeText               Phone           1112223334
    ClickText              --None--        anchor=Type
    ClickText              Prospect
    ClickText              --None--        anchor=Industry
    ClickText              Agriculture
    ClickText              Save            partial_match=false
    UseModal               off
    VerifyText             ExampleName     anchor=Account
    VerifyText             Prospect        anchor=Type
    VerifyText             Agriculture     anchor=Industry

Delete accounts
    LaunchApp              Sales
    ClickText              Accounts
    ClickText              ExampleName
    ClickText              Show more actions
    ClickText              Delete
    ClickText              Delete
    VerifyNoText           ExampleName
