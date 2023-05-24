Feature: Add likes
    Background:
        * url apiURL
    Scenario:
        Given path 'articles',slug,'favorite'
        And request {}
        When method Post
        Then status 200
        * def likeCounts = response.article.favoritesCount