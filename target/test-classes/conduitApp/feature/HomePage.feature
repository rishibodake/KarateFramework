Feature: Tests for home page

    Scenario:Get all tags
        Given url 'https://api.realworld.io/api/tags'
        When method Get
        Then status 200

    Scenario: Get all articles on homepage
        Given url 'https://api.realworld.io/api/articles?limit=10&offset=0'
        When method Get
        Then status 200