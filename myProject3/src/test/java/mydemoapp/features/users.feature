Feature: script to fetch users info

  Background: Set base URL
    * url 'https://reqres.in/api'
  
  Scenario: get info of 3rd user
    Given path '/users/3'
    When method get
    Then status 200

  Scenario: create a new user
    Given path '/users'
    * def payload =
    """
        {
          "name": "morpheus",
          "job": "leader"
        } 
    """
    And request payload
    When method post
    Then status 201
    #response will be object type
    And match response == "#object"
    And match response.name == "morpheus"

  Scenario: create a new user using json request
    Given path '/users'
    * def projectPath = karate.properties['user.dir']
    * def payload = projectPath+'src/test/java/mydemoapp/resources/userCreateRequest.json'
    And request payload
    When method post
    Then status 201
    And match response contains { "id": "#present" }
    
  Scenario: get users info from 2nd page
    Given path '/users'
    #param is used as key:value pair to form the API url
    #the following url becomes https://reqres.in/api/users?page=2
    And param page = "2"
    When method get
    Then status 200
    And match response.page == 2

  Scenario: update email of 4th users
    Given path '/users/4'
    * def payload =
    """
        {
          "email": "zico@gmail.com"
        } 
    """
    And request payload
    When method patch
    Then status 200
    And match response.email == "zico@gmail.com"
    * print "updated time is " + response.updatedAt 

  Scenario: update total info of 5th users
    Given path '/users/5'
    * def payload =
    """
        {
          "id" : 39,
          "first_name":"Tony",
          "email": "tony@yahoo.com"
        } 
    """
    And request payload
    When method put
    Then status 200
    And match response.id == "#number"
    And match response.email == "tony@yahoo.com"
    #this will match if key updatedAt exists in the response
    And match response contains { "updatedAt": "#present" }

  Scenario: delete info of 6th user
    Given path '/users/6'
    When method delete
    Then status 204

  Scenario: save a cookie
    Given cookie foo = 'bar'
