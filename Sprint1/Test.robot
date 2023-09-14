*** Settings ***
Resource                        ../Resource/common.robot
Library                         String
Library                         DataDriver                  reader_class=TestDataApi    name=AccountDetails.xlsx
Suite Setup                     Setup Browser
Suite Teardown                  End Suite
Test Template                   create Account using excel
*** Test Cases ***
create Account using excel with ${Phone_No}    ${Acc_Name}     ${Fax}    ${Website}    ${Type}    ${Employees}    ${Industry}    ${Annual_Revenue}    ${Description}    ${Billing_Street}    ${Billing_City}    ${Billing_State_Province}    ${Billing_Zip_PostalCode}    ${Billing_Country}    ${Shipping_Street}    ${Shipping_City}    ${Shipping_State_Province}    ${Shipping_Zip_PostalCode}    ${Shipping_Country}
*** Keywords ***
create Account using excel
    [Arguments]                 ${Phone_No}                 ${Acc_Name}                 ${Fax}                      ${Website}    ${Type}        ${Employees}    ${Industry}    ${Annual_Revenue}    ${Description}    ${Billing_Street}    ${Billing_City}    ${Billing_State_Province}                               ${Billing_Zip_PostalCode}                   ${Billing_Country}                              ${Shipping_Street}          ${Shipping_City}       ${Shipping_State_Province}    ${Shipping_Zip_PostalCode}    ${Shipping_Country}
    Appstate                    Home
    LaunchApp                   Sales
    Wait Until Keyword Succeeds                             1 min                       5 sec                       ClickText     Accounts
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=import               timeout=120s
    UseModal                    On
    Wait Until Keyword Succeeds                             1 min                       5 sec                       TypeText      Phone          ${Phone_No}
    TypeText                    *Account Name               ${Acc_Name}
    TypeText                    Fax                         ${Fax}
    TypeText                    Website                     ${Website}
    VerifyText                  Additional Information
    PickList                    Type                        ${Type}
    TypeText                    Employees                   ${Employees}
    PickList                    Industry                    ${Industry}
    TypeText                    Annual Revenue              ${Annual_Revenue}
    TypeText                    Description                 ${Description}
    TypeText                    Billing Street              ${Billing_Street}
    TypeText                    Billing City                ${Billing_City}
    TypeText                    Billing State/Province      ${Billing_State_Province}
    TypeText                    Billing Zip/Postal Code     ${Billing_Zip_PostalCode}
    TypeText                    Billing Country             ${Billing_Country}
    TypeText                    Shipping Street             ${Shipping_Street}
    TypeText                    Shipping City               ${Shipping_City}
    TypeText                    Shipping State/Province     ${Shipping_State_Province}
    TypeText                    Shipping Zip/Postal Code    ${Shipping_Zip_PostalCode}
    TypeText                    Shipping Country            ${Shipping_Country}
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       1
    # End Account creation test case
