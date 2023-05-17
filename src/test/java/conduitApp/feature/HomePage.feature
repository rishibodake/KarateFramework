Feature: Tests for home page

    Background: Define URL
        Given url 'https://api.realworld.io/api/'

    Scenario:Get all tags
        Given path 'tags'
        When method Get
        Then status 200

    Scenario: Get all articles on homepage
        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200