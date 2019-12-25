package com.redhat.developer.demos.sbeventinghello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ExampleController
 */
@RestController
public class ExampleController {
  @GetMapping("/")
  public String myEndpoint() {
        return "{\"hello\":\"world\"}";
  }

  @PostMapping("/")
  public String eventingEndpoint(String cloudEventJSON) {
        return "{\"hello\":\"world\"}";
  }
  
  @GetMapping("/healthz")
  public String health() {
      return "OK";
  }
  
}