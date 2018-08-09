*** Settings ***
Resource     ../../resources/imports.robot

*** Keywords ***
Prepare Data To Login With '${data}'
    Set Test Variable    ${data}   ${data}

Set '${field}' Is '${value}'
    Set Test Variable    ${data.${field}}   ${value}

Set Parameter '${parameter}' is '${value}'
    Set To Dictionary    ${data}    ${parameter}=${value}
    Set Test Variable    ${${parameter}}    ${value}

Send Request To Login
    Create Session  post    ${host}     headers=${header}    verify=True
    ${response}  Post Request    post    ${api.login}    data=${data}
    ${json}=    To Json  ${response.text}
    Set Test Variable   ${response}
    Set Test Variable   ${json}

Verify Response Data
    Should Not Be Empty    ${json['token']}

Status Code Should Be '${expected_status_code}'
    Should Be Equal As Strings    ${expected_status_code}    ${response.status_code}

