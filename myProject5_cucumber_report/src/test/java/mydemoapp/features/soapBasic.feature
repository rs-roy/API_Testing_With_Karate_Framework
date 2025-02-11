Feature: Sample karate test script for soap service

  Background: Set base URL
    * url 'https://www.dataaccess.com/webservicesserver/numberconversion.wso'
  
  @basic  
  Scenario: convert a number into words in soap 1.1
    Given request
    """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope
      xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <NumberToDollars
          xmlns="http://www.dataaccess.com/webservicesserver/">
          <dNum>39</dNum>
        </NumberToDollars>
      </soap:Body>
    </soap:Envelope>    
    """
    #action could be any name like MySoapRequest
    When soap action 'MySoapRequest'  
    Then status 200
    * print '\n', response
    * match response /Envelope/Body/NumberToDollarsResponse/NumberToDollarsResult == "thirty nine dollars"
    * def value = /Envelope/Body/NumberToDollarsResponse/NumberToDollarsResult
    * print '\nConverted $ value is: ', value

