# <img src="https://github.com/pip-services/pip-services/raw/master/design/Logo.png" alt="Pip.Services Logo" style="max-width:30%"> <br> Sessions Microservice Client SDK for Dart

This is a Dart client SDK for [pip-services-sessions](https://github.com/pip-services-users/pip-services-sessions-dart) microservice.

## Download

Right now the only way to get the microservice is to check it out directly from github repository
```bash
git clone git@github.com:pip-services-users/pip-clients-sessions-dart.git
```

Pip.Service team is working to implement packaging and make stable releases available for your 
as zip downloadable archieves.

## Contract

Logical contract of the microservice is presented below. For physical implementation (HTTP/REST),
please, refer to documentation of the specific protocol.

```dart
class SessionV1 implements IStringIdentifiable {
  /* Identification */
  String id;
  String user_id;
  String user_name;

  /* Session info */
  bool active;
  DateTime open_time;
  DateTime close_time;
  DateTime request_time;
  String address;
  String client;

  /* Cached content */
  var user;
  var data;
}

abstract class ISessionsV1 {
  Future<DataPage<SessionV1>> getSessions(
      String correlationId, FilterParams filter, PagingParams paging);

  Future<SessionV1> getSessionById(String correlationId, String id);

  Future<SessionV1> openSession(
      String correlationId,
      String user_id,
      String user_name,
      String address,
      String client,
      dynamic user,
      dynamic data);

  Future<SessionV1> storeSessionData(String correlationId, String sessionId, dynamic data);

  Future<SessionV1> updateSessionUser(String correlationId, String sessionId, dynamic user);

  Future<SessionV1> closeSession(String correlationId, String sessionId);

  Future<SessionV1> deleteSessionById(String correlationId, String sessionId);
}
```

## Use

The easiest way to work with the microservice is to use client SDK. 

Define client configuration parameters that match the configuration of the microservice's external API
```dart
// Client configuration
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

## Acknowledgements

This microservice was created and currently maintained by
- **Sergey Seroukhov**.
- **Nuzhnykh Egor**
