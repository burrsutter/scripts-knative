package com.redhat.developer.demos.sbeventingce;


import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * MyController
 * Illustrates the use of a Spring RestController to access the HTTP headers
 */

@RestController
public class MyController {
  @GetMapping("/")
  public ResponseEntity<String> doGet (
    HttpEntity<String> httpEntity) {
      System.out.println("MyController's doGet() method invoked.");
      outputStuff(httpEntity);   
      return new ResponseEntity<String>(
        "hello", HttpStatus.OK);
  }

  @PostMapping("/")
  public ResponseEntity<String> doPost (
    HttpEntity<String> httpEntity) {
      System.out.println("MyController's doPost() method invoked.");
      outputStuff(httpEntity);
      return new ResponseEntity<String>(
        "hello", HttpStatus.OK);
  }
  
  private void outputStuff(HttpEntity http) {
    System.out.println("Env Vars");
    Map<String, String> env = System.getenv();
    for (String envName : env.keySet()) {
      System.out.format("%s=%s%n", envName, env.get(envName));
    }
    
    System.out.println("HTTP Headers");

    http.getHeaders().forEach((key, value) -> {
      System.out.println(String.format("Header '%s' = %s", key, value));
    });
    
    System.out.println("ce-id=" + http.getHeaders().get("ce-id"));
    System.out.println("ce-source=" + http.getHeaders().get("ce-source"));
    System.out.println("ce-specversion=" + http.getHeaders().get("ce-specversion"));
    System.out.println("ce-time=" + http.getHeaders().get("ce-time"));
    System.out.println("ce-type=" + http.getHeaders().get("ce-type"));
    System.out.println("content-type=" + http.getHeaders().getContentType());
    System.out.println("content-length=" + http.getHeaders().getContentLength());

    System.out.println("POST:" + http.getBody());
    
  }  

}