package helper;

import com.github.javafaker.Faker;

public class DataGenerator {
    
    public static String getRandomEmail(){
        
        return new Faker().name().firstName().toLowerCase() +  new Faker().random().nextInt(0,100) + "@test.com";
        
    }

    public static String getRandomUserName(){
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }
}
