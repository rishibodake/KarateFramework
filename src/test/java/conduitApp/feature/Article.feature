@createARticle
Feature: Articles
    Background: Define URL
        * url apiURL
        * def articleRequestBody = read('classpath:conduitApp/json/newArticle.json')
        * def dataGenerator = Java.type('helper.DataGenerator')
        * set articleRequestBody.article.title = dataGenerator.getRandomArticleValue().title
        * set articleRequestBody.article.description = dataGenerator.getRandomArticleValue().description
        * set articleRequestBody.article.body = dataGenerator.getRandomArticleValue().body

        #  * def tokenResponse = callonce read('classpath:helper/CreateToken.feature')
        #  * def token = tokenResponse.authToken             
    
   
    Scenario: Create a new article
        Given path 'articles'
        And request articleRequestBody
        When method post
        Then status 200
        And match response.article.title == articleRequestBody.article.title


    Scenario: Create and delete an article
        Given path 'articles'
        And request articleRequestBody
        When method post
        Then status 200
        And match response.article.title == articleRequestBody.article.title
        * def articleId = response.article.slug

        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
    #    And match response.articles[0].title == articleRequestBody.article.title
        
        Given path 'articles',articleId
        When method delete
        Then status 204

        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title != 'Updated title Four41'

        