Feature: Articles
    Background: Define URL
        Given url 'https://api.realworld.io/api/'


    Scenario: Create a new article
        Given path 'users/login'
        And request {"user": {"email": "karate8108@karate.com","password": "karate12"}}
        When method post
        Then status 200
        * def token = response.user.token

        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"title": "Updated title one","description": "Article","body": "Hello There","tagList": []}}
        When method post
        Then status 200
        And match response.article.title == 'Updated title one'