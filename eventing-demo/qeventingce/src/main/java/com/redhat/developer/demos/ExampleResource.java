package com.redhat.developer.demos;

import java.io.StringReader;
import java.net.URI;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.JsonReader;
import javax.validation.Validator;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import io.cloudevents.v1.CloudEventBuilder;
import io.cloudevents.v1.CloudEventImpl;
import io.cloudevents.CloudEvent;
import io.cloudevents.v1.AttributesImpl;
import io.cloudevents.v1.http.Marshallers;

@Path("/")
public class ExampleResource {
  @Inject
    Validator validator;
    
  @GET
  @Consumes(MediaType.APPLICATION_JSON)
  @Produces(MediaType.APPLICATION_JSON)
  @Path("/")
  public String servingEndpoint() {
    System.out.println("ExampleResource's @GET method invoked.");
    outputEnv();
    return "{\"hello\":\"world\"}";
  }

  @POST
  @Consumes(MediaType.APPLICATION_JSON)
  @Produces(MediaType.APPLICATION_JSON)
  @Path("/")
  public Response eventingEndpoint(@Context HttpHeaders httpHeaders,  String cloudEventData) {
    System.out.println("ExampleResource's @POST method invoked.");
    
    // Log env vars
    outputEnv();

    // Log inbound CloudEvent
    System.out.println("ce-id=" + httpHeaders.getHeaderString("ce-id"));
    System.out.println("ce-source=" + httpHeaders.getHeaderString("ce-source"));
    System.out.println("ce-specversion=" + httpHeaders.getHeaderString("ce-specversion"));
    System.out.println("ce-time=" + httpHeaders.getHeaderString("ce-time"));
    System.out.println("ce-type=" + httpHeaders.getHeaderString("ce-type"));
    System.out.println("content-type=" + httpHeaders.getHeaderString("content-type"));
    System.out.println("content-length=" + httpHeaders.getHeaderString("content-length"));
    System.out.println("cloudEventData=" + cloudEventData);

    // Log the inbound CE data - comes via HTTP POST
    // This assumes the Event Source is providing the data as a string of JSON
    // Example: {"message": "From CronJob Source"}

    // JSON-P to dig into the cloudEventData    
    JsonReader jsonReader = Json.createReader(new StringReader(cloudEventData));
    JsonObject myJsonObject = jsonReader.readObject();   
    String msg = myJsonObject.getString("message");
        
    System.out.println("POST:" + cloudEventData);
    System.out.println("BURR3 msg:" + msg);
    
    // Craft a Response JSON
    JsonObjectBuilder builder = Json.createObjectBuilder();   
    builder.add("aloha", "bonjour");   
    builder.add("message", msg);
  
    String responsePayload = builder.build().toString();
    
    System.out.println("responsePayload:" + responsePayload);

    // Craft a response CloudEvent
    final String eventType = "com.redhat.developers.demo.eventinghello";
    final String eventId = UUID.randomUUID().toString();
    final URI src = URI.create("/eventinghellosrc");
    
    CloudEventImpl<String> ceResponse = null;
    
    CloudEvent<AttributesImpl, Map> event = Marshallers
    .binary(Map.class,validator)
    .withHeaders(() -> headers)
    .withPayload(() -> cloudEventPayload)
    .marshal();

    try {
      System.out.println("try");
      ceResponse =
      CloudEventBuilder.<String>builder()
      .withType(eventType)
      .withId(eventId)
      .withSource(src)
      .withData(responsePayload)
      .build();
      System.out.println("build completed");
    } catch (Exception e) {
      System.out.println("ERROR: " + e.getMessage());
      e.printStackTrace(System.out);
    }

    System.out.println("ceResponse:" + ceResponse.toString());  
    
    // String responseJSON = io.cloudevents.json.Json.encode(ceResponse);
    String responseJSON = "{\"hello\":\"world\"}";

    System.out.println("responseJSON:\n" + responseJSON + "\n\n");

    return Response.status(Status.OK).entity(responseJSON).build();
    
  }

  private void outputEnv() {
    Map<String, String> env = System.getenv();
    for (String envName : env.keySet()) {
      System.out.format("%s=%s%n", envName, env.get(envName));
    }
  }

}