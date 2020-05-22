import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'package:pip_clients_sessions/pip_clients_sessions.dart';

class SessionsClientFixtureV1 {
  ISessionsClientV1 _client;

  SessionsClientFixtureV1(ISessionsClientV1 client) {
    expect(client, isNotNull);
    _client = client;
  }

  void testOpenSession() async {
    SessionV1 session1;

    // Open new session
    session1 = await _client.openSession(
        null, '1', 'User 1', 'localhost', 'test', null, 'abc');
    expect(session1, isNotNull);
    expect(session1.id, isNotNull);
    expect(session1.request_time, isNotNull);
    expect(session1.address, 'localhost');
    expect(session1.client, 'test');
    expect(session1.data, 'abc');

    // Store session data
    await _client.storeSessionData(null, session1.id, 'xyz');

    // Update session user
    await _client.updateSessionUser(null, session1.id, 'xyz');

    // Load created session
    var session = await _client.getSessionById(null, session1.id);
    expect(session, isNotNull);
    expect(session1.id, session.id);
    expect(session.request_time, isNotNull);
    expect(session.address, 'localhost');
    expect(session.client, 'test');
    expect(session.data, 'xyz');

    // Get open sessions
    var page = await _client.getSessions(
        null,
        FilterParams.fromTuples(['user_id', '1', 'active', true]),
        PagingParams());
    expect(page, isNotNull);
    expect(page.data.length, 1);

    session = page.data[0];
    expect(session.address, 'localhost');
    expect(session.client, 'test');
  }

  void testCloseSession() async {
    SessionV1 session1;

    // Open new session
    session1 = await _client.openSession(
        null, '2', 'User 2', 'localhost', 'test', null, null);
    expect(session1, isNotNull);
    expect(session1.id, isNotNull);
    expect(session1.request_time, isNotNull);

    // Close created session
    await _client.closeSession(null, session1.id);

    // Get open sessions
    var page = await _client.getSessions(
        null,
        FilterParams.fromTuples(['user_id', '2', 'active', true]),
        PagingParams());
    expect(page, isNotNull);
    expect(page.data.length, 0);
  }
}
