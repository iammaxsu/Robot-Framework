*** Settings ***
Documentation   This is a practice for comparing objects with Robot Framework.
Library     SSHLibrary

*** Variables ***
${host_addr}    172.16.33.29
${host_username}    max
${host_password}    P@ssw0rd
${username}     Administrator
${password}     superuser
${address}      172.16.33.242
${URL}  https://${username}:${password}@${address}/redfish/v1/
${CPU_num}  0   # CPU number
${MaxCPU_num}   2   # maximum CPU number
${DIMM_num}    0   # DIMM number
${MaxDIMM_num}    24  # maximum DIMM number


*** Test Cases ***
Compare numbers
    [Tags]  practice
    Should Be Equal     10  10
    should not be equal     5   10
#    should be equal     5   10
#    should not be Equal     10  10


Compare strings
    [Tags]  practice
    Should Be Equal As Strings      Pass    Pass
#    should be equal as strings   Fail    Pass
    should not be equal as strings  Pass    Fail
#    should not be equal as strings  Pass    Pass


Test DMI type
    [Documentation]     Verify DMI type.
    [Tags]  dmitype42   42
    [Teardown]  close all connections
    Login SSH
    write     su    
    write   ${host_password}
    execute command   dmidecode -t 42 | grep 0x004A | awk '{print $5}' | sed 's/.$//'
    ${text}     read command output
    #${text}     read    delay=2
    should contain    ${text}     42


#   *** Tasks ***


*** Keywords ***
Custome Teardown
    close all browsers

Login SSH
    open connection     ${host_addr}    prompt=$
    ${std_output}=   login  ${host_username}    ${host_password}
    should contain  ${std_output}   $


*** Comments ***
This practice includes:
1. Use "should be equal" to compare numbers.
2. Use "should be equal as strings" to compare strings.

Note:
1. Keywords are not case sensitive. For example, "should be equal" is as workable as "Should Be Equal".

