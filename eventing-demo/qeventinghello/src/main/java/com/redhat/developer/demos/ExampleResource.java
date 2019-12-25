package com.redhat.developer.demos;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/")
public class ExampleResource {
  @GET
  @Consumes(MediaType.APPLICATION_JSON)
  @Produces(MediaType.TEXT_PLAIN)
  @Path("/")
  public String myEndpoint() {
        return "{\"hello\":\"world\"}";
  }

  @POST
  @Consumes(MediaType.APPLICATION_JSON)
  @Produces(MediaType.TEXT_PLAIN)
  @Path("/")
  public String eventingEndpoint(String cloudEventJSON) {
        return "{\"hello\":\"world\"}";
  }

  @GET
  @Path("/healthz")
  public String health() {
      return "OK";
  }
}