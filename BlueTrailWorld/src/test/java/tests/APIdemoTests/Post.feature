Feature: Post API Demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")
    * def projectPath = karate.properties['user.dir']
    * def dataPath = projectPath + "/src/test/java/data/"
    * def requestBody = read('file:' + dataPath + 'request1.json')

  # Simple post request
  Scenario: Post Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Rob","job": "heerser"}
    When method POST
    Then status 201
    And print response

  # Post with background
  Scenario: Post Demo 2
    Given path '/users'
    And request {"name": "Rob","job": "heerser"}
    When method POST
    Then status 201
    And print response

  # Post with assertions
  Scenario: Post Demo 3
    Given path '/users'
    And request {"name": "Rob","job": "heerser"}
    When method POST
    Then status 201
    And match response == {"name": "Rob","job": "heerser","id": "#string","createdAt": "#ignore"}
    And print response

  # Post with read response from file
  Scenario: Post Demo 4
    Given path '/users'
    And request {"name": "Rob","job": "heerser"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  # Post with read request from file
  Scenario: Post Demo 5
    Given path '/users'
    And print projectPath
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  # Post with read request from file
  Scenario: Post Demo 6
    Given path '/users'
    And set requestBody.job = 'Loser'
    And request requestBody
    When method POST
    Then status 201
    And set expectedOutput.job = 'Loser'
    And match response == expectedOutput
    And print response
