package com.service.eureka.server.configuration;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import java.util.Objects;

@Configuration
public class SSLConfig {

    @Autowired
    private Environment env;

//    @PostConstruct
//    private void configureSSL() {
//        //set to TLSv1.1 or TLSv1.2
//
//        System.setProperty("https.protocols", "TLSv1.1");
//
//        //load the 'javax.net.ssl.trustStore' and
//        //'javax.net.ssl.trustStorePassword' from application.properties
//
//        System.setProperty("javax.net.ssl.trustStore", Objects.requireNonNull(env.getProperty("server.ssl.trust-store")));
//        System.setProperty("javax.net.ssl.trustStorePassword", Objects.requireNonNull(env.getProperty("server.ssl.trust-store-password")));
//    }
}
