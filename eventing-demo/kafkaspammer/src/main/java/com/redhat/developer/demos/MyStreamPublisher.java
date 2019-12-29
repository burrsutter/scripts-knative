package com.redhat.developer.demos;


import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import io.smallrye.reactive.messaging.annotations.Emitter;
import io.smallrye.reactive.messaging.annotations.Channel;
// import io.smallrye.reactive.messaging.annotations.Stream;

@ApplicationScoped
@Path("/")
public class MyStreamPublisher {

    int cnt = 0;

    @Inject @Channel("mystream")
    Emitter<String> emitter;


    @GET
    public String send1() {
      emitter.send("{\"message\":\"sending-" + cnt++ +"\"}");
      System.out.println("Sent 1 Message");
      return "Sent 1";
    }

    @GET
    @Path("/{messagestosend}")
    public String sendNMessages(@PathParam("messagestosend") int messagestosend) {
      System.out.println("messagestosend: " + messagestosend);
      for (int i=0; i < messagestosend; i++) {
        System.out.println("sending i: " + i);
        emitter.send("{\"message\":\"spamming-" + cnt++ +"\"}");
      }
      String output = "Sent " + messagestosend + " messages";
      return output;
    }
 
    
}