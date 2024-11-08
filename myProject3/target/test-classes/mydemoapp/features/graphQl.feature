Feature: Test GraphQl API endpoint

  Background: Set the base URL
    * url 'https://graphqlzero.almansi.me'

  @graphql_example
  Scenario: Fetch only capital and currency from countries
    Given path '/api'
    # note the use of text instead of def since this is NOT json    
    * text query =
    """
    {
    user(id: 2) {
        posts {
        data {
            id
            title
        }
      }
     }
    }
    """
    # fetching only id and title for user 2
    And request { query : '#query' }
    When method post
    Then status 200


