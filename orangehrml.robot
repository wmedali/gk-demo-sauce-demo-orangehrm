*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary    locale=de_DE


*** Test Cases ***
Acceder au formulaire de contact de sales
    Open Browser    https://www.orangehrm.com/en/contact-sales/    chrome
    Maximize Browser Window

Remplir le formulaire de contact
    ${firstName}    FakerLibrary.Name
    Input Text    id:Form_getForm_FullName    ${firstName}
    ${phoneNumber}    FakerLibrary.Phone Number
    Input Text    id:Form_getForm_Contact    ${phoneNumber}
    # Select From List By Label    id:Form_getForm_Country    Austria
    # Select From List By Index    id:Form_getForm_Country    37
    ${country}    FakerLibrary.Country
    Select From List By Value    id:Form_getForm_Country    ${country}
    ${email}    FakerLibrary.Email
    Input Text    css:[id="Form_getForm_Email"]    ${email}
    ${jobTitle}    FakerLibrary.Job
    Input Text    css:[id="Form_getForm_JobTitle"]    ${jobTitle}
    ${longMessage}    FakerLibrary.Paragraph    nb_sentences=9
    Input Text    css:[id="Form_getForm_Comment"]    ${longMessage}
