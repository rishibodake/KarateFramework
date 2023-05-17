Feature: Tests for home page

    Scenario:Get all tags
        Given url 'https://api.realworld.io/api/tags'
        When method Get
        Then status 200

    Scenario: Get all articles on homepage
        Given params {limit:10, offset:0}
        Given url 'https://api.realworld.io/api/articles'
        When method Get
        Then status 200