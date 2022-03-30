*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead
    Appstate                  Home
    LaunchApp                 Sales

    ClickText                 Leads
    VerifyText                Change Owner
    ClickText                 New
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    Picklist                  Salutation                  Ms.
    TypeText                  First Name                  Tina
    TypeText                  Last Name                   Smith
    Picklist                  Lead Status                 New
    TypeText                  Phone                       +12234567858449             First Name
    TypeText                  Company                     Growmore                    Last Name
    TypeText                  Title                       Manager                     Address Information
    TypeText                  Email                       tina.smith@gmail.com        Rating
    TypeText                  Website                     https://www.growmore.com/

    Picklist                  Lead Source                 Partner
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     1
    
    ClickText                 Details
    VerifyField               Name                        Ms. Tina Smith
    VerifyField               Lead Status                 New
    VerifyField               Phone                       +12234567858449
    VerifyField               Company                     Growmore
    VerifyField               Website                     https://www.growmore.com/

    # as an example, let's check Phone number format. Should be "+" and 14 numbers
    ${phone_num}=             GetFieldValue               Phone
    Should Match Regexp	      ${phone_num}	              ^[+]\\d{14}$
    
    ClickText                 Leads
    VerifyText                Tina Smith
    VerifyText                Manager
    VerifyText                Growmore

Delete Tina Smith's Lead
    [tags]                    Lead
    LaunchApp                 Sales
    ClickText                 Leads
    Sleep                     1

    ClickText                    Tina Smith    timeout=3
    ClickText                    Show more actions
    ClickText                    Delete
    ClickText                    Delete
    ClickText                    Close
    VerifyNoText                 Tina Smith

Create StartupABC Account
    [tags]                    Account
    Appstate                  Sales App
    ClickText                 Accounts
    ClickText                    New
    UseModal                     On
    ClickText                    Account Name
    TypeText                     Account Name            StartupABC
    ClickText                    Phone
    ClickText                    Phone
    TypeText                     Phone                   12234567858449
    ClickText                    --None--                anchor=Type
    ClickText                    Investor
    ClickText                    --None--                anchor=Industry
    ClickText                    Banking
    ClickText                    Employees
    TypeText                     Employees               100
    ClickElement                 //*[@name\="SaveEdit"]
    UseModal                     Off

    VerifyText                   StartupABC
    VerifyText                   Banking                 anchor=Industry
    VerifyText                   Investor                anchor=Type

Create TinaSmith Contact
    [tags]                    Contact
    Appstate                  Sales App
    ClickText                 Contacts
    ClickText                 New
    UseModal                  On
    ClickText                 --None--    anchor=Salutation
    ClickText                 Ms.
    ClickText                 First Name
    TypeText                  First Name    Tina
    TypeText                  Last Name     Smith
    ClickText                 Phone
    TypeText                  Phone         +12234567858449
    ClickText                 Account Name
    ClickText                 StartupABC
    ClickText                 Title
    TypeText                  Title         Manager
    ClickText                 Email
    TypeText                  Email         tina.smith@gmail.com
    ClickText                 Save          partial_match=False
    UseModal                  Off

    VerifyText                Ms. Tina Smith
    VerifyText                Manager                   anchor=Title
    VerifyText                +12234567858449           anchor=Phone (2)
    VerifyText                tina.smith@gmail.com      anchor=Email

Delete TinaSmith Contact
    [Tags]                    Contact
    Appstate                  Sales App
    ClickText                 Contacts
    Sleep                     1

    ClickText                 Tina Smith
    ClickText                 Show more actions
    ClickText                 Delete
    ClickText                 Delete
    ClickText                 Close
    VerifyNoText              Tina Smith

Delete StartupABC Account
    [Tags]                    Account
    Appstate                  Sales App
    ClickText                 Accounts
    Sleep                     1

    ClickText                 StartupABC
    ClickText                 Show more actions
    ClickText                 Delete
    ClickText                 Delete
    ClickText                 Close
    VerifyNoText              StartupABC