package com.hochzehn;


import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.integration.annotation.InboundChannelAdapter;

import java.text.DateFormat;
import java.util.Date;

@EnableBinding(Source.class)
public class Sender {

    @InboundChannelAdapter(value = Source.OUTPUT)
    public String timeMessage(){
        return DateFormat.getDateTimeInstance().format(new Date());
    }
}
