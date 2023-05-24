
Feature:Sign up new user

Background: Prconditions
    Given url apiURL
    * def dataGenerator = Java.type('helper.DataGenerator')
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUserName()

Scenario: Sign up
    When path 'users'
    And request 
    """
{
    "user": {
        "email": #(randomEmail),
        "password": "test1234",
        "username": #(randomUsername)
    }
}  
"""  
    When method Post
    Then status 200
    And match response.user ==
    """
        {
        "email": #(randomEmail),
        "username": #(randomUsername),
        "bio": "##string",
        "image": "#string",
        "token": "#string"
    }
"""

@dataGen
Scenario Outline: Negative scenario for invalid username   
    When path 'users'
    And request 
    """
{
    "user": {
        "email": "<email>",
        "password": "<password>",
        "username": "<username>"
    }
}  
"""  
    When method Post
    Then status 422
    And match response == <errorResponse>

    Examples:
    |email         |username           |password  |                 errorResponse                    |
    |#(randomEmail)| karateUser123     |karate123 |{"errors":{"username":["has already been taken"]}}|
    |me12@test.com | #(randomUsername) |karate123 |{"errors":{"email":["has already been taken"]}}   |
    |me12@test.com |                   |karate123 |{"errors":{"username":["can't be blank"]}}        |
    |              | karateUser123     |karate123 |{"errors":{"email":["can't be blank"]}}           |
    |me12@test.com | #(randomUsername) |karate123 |{"errors":{"email":["has already been taken"]}}   |
    |#(randomEmail)| #(randomUsername) |          |{"errors":{"password":["can't be blank"]}}        |
    