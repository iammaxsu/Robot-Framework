*** Settings ***
Documentation   This is a practice to open and close Firefox and Internet Explorer browsers with Robot Framework. 
Library     SeleniumLibrary
Test Teardown   Close All Browsers

*** Variables ***
${HOST}  https://172.16.33.242/


*** Test Cases ***
Open Web UI with Firefox & Internet Explorer
    [Documentation]     Open browsers.
    [Tags]  001
    [Template]  Open Browser
    ${HOST}     ff
    ${HOST}     ie

*** Keywords ***


*** Comments ***
The practice includes:
1. Use keywords to open and close the browser.
2. Set an external library as keyword resource.
3. Set a variable as keyword argument.
4. Use the comment table to note the actions.
5. Use [Documentation] to set a free documentation.
6. Set [Tags] for test cases.
7. Set Test teardown in Settings table.

Note:
1. To use a browser needs browser driver. The driver needs to be put in the same path.
2. Zoom level of IE shall be 100%.
