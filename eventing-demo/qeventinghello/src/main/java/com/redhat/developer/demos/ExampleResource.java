package com.redhat.developer.demos;

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

@Path("/")
public class ExampleResource {
  @GET
  @Consumes(MediaType.APPLICATION_JSON)
  @Produces(MediaType.APPLICATION_JSON)
  @Path("/")
  public String servingEndpoint() {
        return "{\"hello\":\"world\"}";
  }

  @POST
  @Consumes(MediaType.APPLICATION_JSON)
  @Produces(MediaType.APPLICATION_JSON)
  @Path("/")
  public Response eventingEndpoint(@Context HttpHeaders httpHeaders,  String cloudEventJSON) {
    
    System.out.println("ce-id=" + httpHeaders.getHeaderString("ce-id"));
    System.out.println("ce-source=" + httpHeaders.getHeaderString("ce-source"));
    System.out.println("ce-specversion=" + httpHeaders.getHeaderString("ce-specversion"));
    System.out.println("ce-time=" + httpHeaders.getHeaderString("ce-time"));
    System.out.println("ce-type=" + httpHeaders.getHeaderString("ce-type"));
    System.out.println("content-type=" + httpHeaders.getHeaderString("content-type"));
    System.out.println("content-length=" + httpHeaders.getHeaderString("content-length"));


    System.out.println("POST:" + cloudEventJSON);
    

        return Response.status(Status.OK).entity("{\"hello\":\"world\"}").build();        
  }

}