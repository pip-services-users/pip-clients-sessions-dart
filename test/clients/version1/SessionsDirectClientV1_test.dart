import 'dart:async';
import 'package:test/test.dart';
import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services_sessions/pip_services_sessions.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_sessions/pip_clients_sessions.dart';
import './SessionsClientFixtureV1.dart';

void main() {
  group('SessionsDirectClientV1', () {
    SessionsDirectClientV1 client;
    SessionsClientFixtureV1 fixture;
    SessionsMemoryPersistence persistence;
    SessionsController controller;

    setUp(() async {
      var logger = ConsoleLogger();
      persistence = SessionsMemoryPersistence();
      controller = SessionsController();
      var references = References.fromTuples([
        Descriptor('pip-services', 'logger', 'console', 'default', '1.0'),
        logger,
        Descriptor('pip-services-sessions', 'persistence', 'memory',
            'default', '1.0'),
        persistence,
        Descriptor('pip-services-sessions', 'controller', 'default',
            'default', '1.0'),
        controller
      ]);
      controller.setReferences(references);

      client = SessionsDirectClientV1();
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
