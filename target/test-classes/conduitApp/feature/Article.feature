@ignore
Feature: Articles
    Background: Define URL
        Given url apiURL
        * def tokenResponse = callonce read('classpath:helper/CreateToken.feature')
        * def token = tokenResponse.authToken             
    
    @ignore
    Scenario: Create a new article
        Given path 'articles'
        And request {"article": {"title": "Updated title one1","description": "Article","body": "Hello There","tagList": []}}
        When method post
        Then status 200
        And match response.article.title == 'Updated title one1'


    Scenario: Create and delete an article
        Given path 'articles'
        And request {"article": {"title": "Delete Title","description": "Article","body": "Hello There","tagList": []}}
        When method post
        Then status 200
        And match response.article.title == 'Delete Title'
        * def articleId = response.article.slug

        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title == 'Delete Title'
        
        Given path 'articles',articleId
        When method delete
        Then status 204

        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title != 'Updated title Four41'

        