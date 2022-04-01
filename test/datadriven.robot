*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering Accounts
    [Documentation]        Enters 10 new accounts using a .csv file
    Appstate               Home