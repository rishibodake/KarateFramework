Feature:Sign up new user

Background: Prconditions
    Given url apiURL
@test1
Scenario: Sign up
    Given def userData = {"email":"mybring123@test.com","username":"mybringbacks123"}
    When path 'users'
    And request 
    """
{
    "user": {
        "email": 'test'+#(userData.email),
        "password": "test1234",
        "username": 'user'+#(userData.username)
    }
}    """
    When method post
    Then status 200 

