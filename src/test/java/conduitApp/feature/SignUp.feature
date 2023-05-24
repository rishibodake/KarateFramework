
Feature:Sign up new user

Background: Prconditions
    * def dataGenerator = Java.type('helper.DataGenerator')
    Given url apiURL
@dataGen
Scenario: Sign up
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUserName()
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

