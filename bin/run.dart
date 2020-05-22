import 'package:pip_clients_sessions/pip_clients_sessions.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

Future<void> main(List<String> argument) async {
  try {
    var correlationId = '123';
    var config = ConfigParams.fromTuples([
      'connection.type',
      'http',
      'connection.host',
      'localhost',
      'connection.port',
      8080
    ]);
    var client = SessionsHttpClientV1();
    client.configure(config);
    await client.open(correlationId);
    // Create 2 sessions
    var session1 = await client.openSession(
        null, '1', 'User 1', 'localhost', 'test', null, 'abc');
    var session2 = await client.openSession(
        null, '2', 'User 2', 'localhost', 'test', 'xyz', null);
    var page = await client.getSessions(null, null, null);
    if (page.data.length == 2) {
      print('Get sessions length: ' +
          page.data.length.toString() +
          '! Everything works well!');
    } else {
      print('Get sessions length: ' +
          page.data.length.toString() +
          ' is not equal! Something was wrong!');
    }
    // Close session 1
    await client.closeSession(correlationId, session1.id);
    var closed = await client.getSessionById(correlationId, session1.id);
    if (!closed.active) {
      print('Session is not active! Everything OK!');
    } else {
      print('Session is still active! Something was wrong!');
    }

    // Check opened sessions
    page = await client.getSessions(
        null, FilterParams.fromTuples(['active', true]), null);
    if (page.data.length == 1) {
      print('Get sessions length: ' +
          page.data.length.toString() +
          '! Everything works well!');
    } else {
      print('Get sessions length: ' +
          page.data.length.toString() +
          ' is not equal! Something was wrong!');
    }
    // Close session 2
    await client.closeSession(correlationId, session2.id);
    // Check opened sessions
    page = await client.getSessions(
        null, FilterParams.fromTuples(['active', true]), null);
    if (page.data.isEmpty) {
      print('Get sessions length: ' +
          page.data.length.toString() +
          '! Everything works well!');
    } else {
      print('Get sessions length: ' +
          page.data.length.toString() +
          ' is not equal! Something was wrong!');
    }
    await client.close(correlationId);
  } catch (ex) {
    print(ex);
  }
}
