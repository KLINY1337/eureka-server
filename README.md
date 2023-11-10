# Eureka server

This repository contains the source code for an Eureka Server, a component of a microservices architecture that provides service discovery and registration.

## Configuration

### Spring properties:

```spring.application.name```: Name of the Eureka Server application.

```server.port```: Port on which the Eureka Server will run.

### Eureka Server:

```eureka.instance.hostname```: Hostname of the Eureka Server.

```eureka.client.register-with-eureka```: Set to ```false``` to disable self-registration with Eureka.

```eureka.client.fetch-registry```: Set to ```false``` to disable fetching the registry.

## Security

The Eureka Server is secured using Spring Security. The default username and password are specified in the ```application.properties```:

```spring.security.user.name```

```spring.security.user.password```

## Getting Started

To run the Eureka Server locally, follow these steps:

Clone this repository:
```console
git clone https://github.com/KLINY1337/eureka-server
```

Navigate to the project directory:
```console
cd eureka-server
```

Build and run the application using Maven:
```console
mvn spring-boot:run
```

Or build Docker image using ```Dockerfile```:
```console
docker build .
```

## Usage

The Eureka Server provides a dashboard accessible at ```http://localhost:8761``` by default. Here, you can monitor registered services and instances.
