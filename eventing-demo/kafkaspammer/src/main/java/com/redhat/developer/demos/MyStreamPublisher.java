package com.redhat.developer.demos;

// import java.util.Random;
import java.util.concurrent.TimeUnit;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;

import io.smallrye.reactive.messaging.annotations.Emitter;
import io.smallrye.reactive.messaging.annotations.Stream;

@ApplicationScoped
@Path("/")
public class MyStreamPublisher {

    int cnt = 0;

    @Inject @Stream("mystream")
    Emitter<String> emitter;

    @GET
    public String hello() {
      return "I am ready, use /1, /3, /10, /100, /1000";
    }
    
    @GET
    @Path("/1")
    public String send1() {
      
      emitter.send("{\"message\":\"sending-" + cnt++ +"\"}");
      return "Sent 1";

    }

    @GET
    @Path("/3")
    public String send3() {
      
      emitter.send("{\"message\":\"sending-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"sending-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"sending-" + cnt++ +"\"}");
      return "Sent 3";

    }

    @GET
    @Path("/10")
    public String send10() {
      
      emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");

      return "Sent 10";
    }


    @GET
    @Path("/100")
    public String send100() {
      for (int i=0;i<100;i++) {
        emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      }
      return "Sent 100";
    }    

    @GET
    @Path("/1000")
    public String send1000() {
      for (int i=0;i<1000;i++) {
        emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      }
      return "Sent 1000";
    }    
 
    
}