# Examples for Sessions Microservice

This is user sessions microservice from Pip.Services library. 
It opens and closes user sessions and stores sessiond data. 

Define configuration parameters that match the configuration of the microservice's external API
```dart
// Service/Client configuration
var httpConfig = ConfigParams.fromTuples(
	"connection.protocol", "http",
	"connection.host", "localhost",
	"connection.port", 8080
);
```

Instantiate the client and open connection to the microservice
```dart
// Create the client instance
var client = SessionsHttpClientV1(config);

// Configure the client
client.configure(httpConfig);

// Connect to the microservice
try{
  await client.open(null)
}catch() {
  // Error handling...
}       
// Work with the microservice
// ...
```

Now the client is ready to perform operations
```dart

    // Open new session
    try {
      var session1 = await client.openSession('123', '1', 'User 1', 'localhost', 'test', 'abc');
      // Do something with the returned session...
    } catch(err) {
      // Error handling...     
    }
```

```dart
// Get the session
try {
var session = await client.getSessionById(
    null,
    session1.id);
    // Do something with session...

    } catch(err) { // Error handling}
```

In the help for each class there is a general example of its use. Also one of the quality sources
are the source code for the [**tests**](https://github.com/pip-services-users/pip-clients-sessions-dart/tree/master/test).
