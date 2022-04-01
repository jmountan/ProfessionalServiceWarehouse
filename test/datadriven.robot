*** Settings ***
Resource                      ../resources/common.robot
Library                       DataDriver    reader_class=TestDataApi       name=New_Accounts.csv
Suite Setup                   Setup Browser
Suite Teardown                End suite
Test Template                 Entering Accounts


*** Test Cases ***
Entering Accounts with ${Account_Name} ${Account_status}

Entering Accounts
    [Arguments]    ${Account_Name}    ${Account_status}
    [Documentation]        Enters 10 new accounts using a .csv file
    Appstate               Home
