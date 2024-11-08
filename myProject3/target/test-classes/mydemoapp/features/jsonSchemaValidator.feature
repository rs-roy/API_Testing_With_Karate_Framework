Feature: Validate Schema

Background: Set base URL
    * url 'https://reqres.in/api'
  
    @schema
  Scenario: Validate the schema of a sample user
    Given path '/users/2'
    When method get
    Then status 200
