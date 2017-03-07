package com.hochzehn;

import org.springframework.cloud.stream.messaging.Source;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static org.springframework.integration.support.MessageBuilder.withPayload;

@RestController
public class KafkaController {

    private Source source;

    public KafkaController(Source source) {
        this.source = source;
    }

    @RequestMapping(value = "/send/{message}", method = RequestMethod.POST)
    public ResponseEntity<?> send(@PathVariable String message) {
        boolean result = source.output().send(withPayload(message).build());
        return result ? ResponseEntity.ok().build() : ResponseEntity.unprocessableEntity().build();
    }
}
