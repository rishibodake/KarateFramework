package helper;

import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;

public class DataGenerator {
    
    public static String getRandomEmail(){
        
        return new Faker().name().firstName().toLowerCase() +  new Faker().random().nextInt(0,100) + "@test.com";
        
    }

    public static String getRandomUserName(){
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }

    public static JSONObject getRandomArticleValue(){
        Faker faker = new Faker();
        String title = faker.name().username();
        String description = faker.gameOfThrones().city();
        String body = faker.gameOfThrones().quote();
        JSONObject json = new JSONObject();
        json.put("title",title);
        json.put("description", description);
        json.put("body", body);
        return json;
    }
}
