package com.hochzehn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Sink;
import org.springframework.integration.annotation.ServiceActivator;

@EnableBinding(Sink.class)
public class Receiver {

    private static Logger logger = LoggerFactory.getLogger(Logger.class);

    @ServiceActivator(inputChannel = Sink.INPUT)
    public void logMessage(Object payload) {
        logger.info("Received: " + payload);
    }

}
