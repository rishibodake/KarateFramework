Feature:Token

Scenario: Create token
    Given url apiURL
     Given path 'users/login'
      And request {"user": {"email": #(userName),"password": #(userPasskey)}}
      When method post
      Then status 200
      * def authToken = response.user.token
   
