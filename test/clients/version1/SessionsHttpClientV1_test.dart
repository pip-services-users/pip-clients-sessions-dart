import 'dart:async';

import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_sessions/pip_clients_sessions.dart';
import './SessionsClientFixtureV1.dart';

var httpConfig = ConfigParams.fromTuples([
  'connection.protocol',
  'http',
  'connection.host',
  'localhost',
  'connection.port',
  8080
]);

void main() {
  group('SessionsHttpClientV1', () {
    SessionsHttpClientV1 client;
    SessionsClientFixtureV1 fixture;

    setUp(() async {
      client = SessionsHttpClientV1();
      client.configure(httpConfig);
      var references = References.fromTuples([
        Descriptor('pip-services-sessions', 'client', 'http', 'default', '1.0'),
        client
      ]);
      client.setReferences(references);
      fixture = SessionsClientFixtureV1(client);
      await client.open(null);
    });

    tearDown(() async {
      await client.close(null);
      await Future.delayed(Duration(milliseconds: 2000));
    });

    test('Open Session', () async {
      await fixture.testOpenSession();
    });

    test('Close Session', () async {
      await fixture.testCloseSession();
    });
  });
}
