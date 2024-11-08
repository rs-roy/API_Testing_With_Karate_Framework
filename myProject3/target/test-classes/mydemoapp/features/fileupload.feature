@upload
Feature: api script to test file upload

  Background: Set base URL
    * url 'https://petstore.swagger.io/v2/pet/9223372036854097000/uploadImage'

  Scenario: user uploads a pdf file
    # here 1st file means we are uploading a file and 2nd file comes from the key:value form-date of API 
    # we need to check how test.pdf can be kept outside of features folder and read
    Given multipart file file = { read: 'test.pdf', filename: 'test.pdf', contentType: 'application/pdf' }
    When method post
    Then status 200

    And match response contains { "message": "#present" }
