*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
Test Template                 Entering A Department

*** Test Cases ***

Entering a Lead
    Appstate    Home
