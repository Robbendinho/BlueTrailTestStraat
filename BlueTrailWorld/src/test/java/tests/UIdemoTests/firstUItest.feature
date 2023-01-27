Feature: The first UI tests in this repo

Scenario: The first UI test going to Google
    Given driver 'https://www.google.nl/'
    And click("//button[@id='L2AGLb']")   
    And input('input[name=q]', 'Bluetrail')
    When click('input[name=btnI]')
    Then waitForUrl('https://www.bluetrail.nl')