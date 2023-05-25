@createARticle
Feature: Articles
    Background: Define URL
        * url apiURL
        * def articleRequestBody = read('classpath:conduitApp/json/newArticle.json')
        * def dataGenerator = Java.type('helper.DataGenerator')
        * set articleRequestBody.article.title = dataGenerator.getRandomArticleValue().title
        * set articleRequestBody.article.description = dataGenerator.getRandomArticleValue().description
        * set articleRequestBody.article.body = dataGenerator.getRandomArticleValue().body

    


    Scenario: Create and delete an article
        Given path 'articles'
        And request articleRequestBody
        When method post
        Then status 200
        * def articleId = response.article.slug
        
        Given path 'articles',articleId
        When method delete
        Then status 204
