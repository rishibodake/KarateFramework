Feature: Articles
    Background: Define URL
        Given url 'https://api.realworld.io/api/'
        Given path 'users/login'
         And request {"user": {"email": "karate8108@karate.com","password": "karate12"}}
        When method post
        Then status 200
        * def token = response.user.token

    @ignore
    Scenario: Create a new article
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"title": "Updated title one","description": "Article","body": "Hello There","tagList": []}}
        When method post
        Then status 200
        And match response.article.title == 'Updated title one'


    Scenario: Create and delete an article
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"title": "Updated title Four41","description": "Article","body": "Hello There","tagList": []}}
        When method post
        Then status 200
        And match response.article.title == 'Updated title Four41'
        * def articleId = response.article.slug

        Given header Authorization = 'Token ' + token
        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title == 'Updated title Four41'
        
        Given header Authorization = 'Token ' + token
        Given path 'articles',articleId
        When method delete
        Then status 204

        Given header Authorization = 'Token ' + token
        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title != 'Updated title Four41'

        