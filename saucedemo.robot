*** Settings ***
Library     FakerLibrary    locale=fr_FR
Library     SeleniumLibrary


*** Test Cases ***
Authentification
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser Window
    Input Text    css:[placeholder="Username"]    standard_user
    Input Password    css:[id="password"]    secret_sauce
    Click Element    css:[data-test="login-button"]
    Location Should Contain    /inventory.html
    Element Should Be Visible    css:[id="react-burger-menu-btn"]
    Element Should Be Visible    css:[class="inventory_item"]

Ajout du produit au panier
    Click Element    css:[data-test="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    css:[data-test="remove-sauce-labs-backpack"]
    Click Element    css:[data-test="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    css:[data-test="remove-sauce-labs-bolt-t-shirt"]
    Element Should Contain    css:[class="shopping_cart_badge"]    2
    Click Element    css:[class="shopping_cart_link"]
    Location Should Contain    /cart.html
    Click Element    css:[data-test="checkout"]
    Location Should Contain    /checkout-step-one.html

Finaliser le panier
    ${firstName}    FakerLibrary.First Name
    Input Text    css:[data-test="firstName"]    ${firstName}
    ${lastName}    FakerLibrary.Last Name Female
    Input Text    css:[data-test="lastName"]    ${lastName}
    ${postalCode}    FakerLibrary.Postcode
    Input Text    css:[data-test="postalCode"]    ${postalCode}
