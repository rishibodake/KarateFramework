Feature:Token

Scenario: Create token
    Given url 'https://api.realworld.io/api/'
     Given path 'users/login'
      And request {"user": {"email": "karate8108@karate.com","password": "karate12"}}
      When method post
      Then status 200
      * def authToken = response.user.token
   
