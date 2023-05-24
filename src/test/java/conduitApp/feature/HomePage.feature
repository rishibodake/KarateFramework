Feature: Tests for home page

    Background: Define URL
        Given url apiURL
    Scenario:Get all tags
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains ['welcome','introduction']
        And match response.tags contains any ['introduction','hi','checking']
        And match response.tags !contains 'truck'
        And match response.tags == "#array"
        And match each response.tags == "#string"

    @getArticle    
    Scenario: Get first 10 articles on homepage
        * def timeValidator = read('classpath:helper/timeValidator.js')

        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles == '#[10]'
        #making use of fuzzy validattion i.e #string and schema validation
        And match each response.articles ==    
        """
            {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": '#array',
            "createdAt": '#? timeValidator(_)',
            "updatedAt": '#? timeValidator(_)',
            "favorited": '#boolean',
            "favoritesCount": '#number',
            "author": {
                "username": "#string",
                "bio": "##string",
                "image": "#string",
                "following": '#boolean'
            }
            }
        """