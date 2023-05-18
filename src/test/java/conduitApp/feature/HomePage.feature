Feature: Tests for home page

    Background: Define URL
        Given url 'https://api.realworld.io/api/'

    @debug
    Scenario:Get all tags
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains ['welcome','introduction']
        And match response.tags !contains 'truck'
        And match response.tags == "#array"
        And match each response.tags == "#string"

    Scenario: Get all articles on homepage
        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles == '#[10]'
        And match response.articlesCount == 197