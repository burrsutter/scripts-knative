package com.redhat.developer.demos;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
public class ExampleResourceTest {

    @Test
    public void testHelloEndpoint() {
        given()
          .when().get("/")
          .then()
             .statusCode(200)
             .body(is("{\"hello\":\"world\"}"));
    }

    @Test
    public void testEventingEndpoint() {
        given().urlEncodingEnabled(false)
          .header("ce-id","my-ce-id")
          .header("ce-source","my-ce-source")
          .header("ce-specversion","1.0")
          .header("ce-time",new java.util.Date().toString())
          .header("ce-type","my-ce-type")
          .header("content-type","application/json")
          .body("{\"message\": \"From RestAssured Test\"}")
          .post("/")
          .then()
             .statusCode(200);
    }

}