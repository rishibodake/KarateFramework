Feature: Articles
    Background: Define URL
        Given url 'https://api.realworld.io/api/'
        * def tokenResponse = callonce read('classpath:helper/CreateToken.feature')
        * def token = tokenResponse.authToken             
    
    @debug
    Scenario: Create a new article
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"title": "Updated title one1","description": "Article","body": "Hello There","tagList": []}}
        When method post
        Then status 200
        And match response.article.title == 'Updated title one1'


    Scenario: Create and delete an article
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"title": "Delete Title","description": "Article","body": "Hello There","tagList": []}}
        When method post
        Then status 200
        And match response.article.title == 'Delete Title'
        * def articleId = response.article.slug

        Given header Authorization = 'Token ' + token
        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title == 'Delete Title'
        
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

        