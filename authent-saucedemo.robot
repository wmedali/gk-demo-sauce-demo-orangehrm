*** Settings ***
Resource            Ressources/auth.robot

Test Setup          Open Browser    https://www.saucedemo.com/    chrome
Test Teardown       Close All Browsers


*** Test Cases ***
Authentification avec succès
    Authentification    standard_user    secret_sauce
    Location Should Contain    /inventory.html
    Element Should Be Visible    css:[id="react-burger-menu-btn"]
    Element Should Be Visible    css:[class="inventory_item"]

Authentification avec username vide
    Authentification    ${EMPTY}    secret_sauce
    Element Should Be Visible    css:[data-test="error"]
    Element Should Contain    css:[data-test="error"]    Username is required

Authentification avec password vide
    Authentification    standard_user    ${EMPTY}
    Element Should Be Visible    css:[data-test="error"]
    Element Should Contain    css:[data-test="error"]    Password is required

Authentification avec Locked out user
    Authentification    locked_out_user    secret_sauce
    Element Should Be Visible    css:[data-test="error"]
    Element Should Contain    css:[data-test="error"]    Sorry, this user has been locked out
