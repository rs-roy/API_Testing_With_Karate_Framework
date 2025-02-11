Feature: test script with request/response files with soap 1.2

  Background: Set base URL
    * url 'http://www.dneonline.com/calculator.asmx'
  
   @extended 
  Scenario: add operation with soap 1.2 format from external file
    #classpath finds the 'root' folder as src/test/java 
    Given request read('classpath:/mydemoapp/resources/request.xml')
    And header Content-Type = 'application/soap+xml; charset=utf-8'
    # in soap 1.2 'method keyword' is used instead of 'soap action'
    When method post
    Then status 201
    * print '\n', response
    And match response == read('classpath:/mydemoapp/resources/response.xml')
