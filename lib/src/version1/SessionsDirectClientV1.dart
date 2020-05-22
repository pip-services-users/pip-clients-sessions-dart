import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import './SessionV1.dart';
import './ISessionsClientV1.dart';

class SessionsDirectClientV1 extends DirectClient<dynamic>
    implements ISessionsClientV1 {
  SessionsDirectClientV1() : super() {
    dependencyResolver.put('controller',
        Descriptor('pip-services-sessions', 'controller', '*', '*', '1.0'));
  }

  /// Gets a page of sessions retrieved by a given filter.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [filter]            (optional) a filter function to filter items
  /// - [paging]            (optional) paging parameters
  /// Return         Future that receives a data page
  /// Throws error.
  @override
  Future<DataPage<SessionV1>> getSessions(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var timing = instrument(correlationId, 'sessions.get_sessions');
    var page = await controller.getSessions(correlationId, filter, paging);
    timing.endTiming();
    return page;
  }

  /// Gets a session by its unique id.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [sessionId]                an id of session to be retrieved.
  /// Return         Future that receives session or error.
  @override
  Future<SessionV1> getSessionById(
      String correlationId, String sessionId) async {
    var timing = instrument(correlationId, 'sessions.get_session_by_id');
    var session = await controller.getSessionById(correlationId, sessionId);
    timing.endTiming();
    return session;
  }

  /// Creates a new session.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [user_id]              an user id of created session.
  /// - [user_name]              an user name of created session.
  /// - [address]              an address of created session.
  /// - [client]              a client of created session.
  /// - [user]              an user of created session.
  /// - [data]              an data of created session.
  /// Return         (optional) Future that receives created session or error.
  @override
  Future<SessionV1> openSession(String correlationId, String user_id,
      String user_name, String address, String client, user, data) async {
    var timing = instrument(correlationId, 'sessions.open_session');
    var session = await controller.openSession(
        correlationId, user_id, user_name, address, client, user, data);
    timing.endTiming();
    return session;
  }

  /// Updates a session's data.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [data]              an data to be updated.
  /// Return         (optional) Future that receives updated session
  /// Throws error.
  @override
  Future<SessionV1> storeSessionData(
      String correlationId, String sessionId, data) async {
    var timing = instrument(correlationId, 'sessions.store_session_data');
    var session =
        await controller.storeSessionData(correlationId, sessionId, data);
    timing.endTiming();
    return session;
  }

  /// Updates a session's user.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [user]              an user to be updated.
  /// Return         (optional) Future that receives updated session
  /// Throws error.
  @override
  Future<SessionV1> updateSessionUser(
      String correlationId, String sessionId, user) async {
    var timing = instrument(correlationId, 'sessions.update_session_user');
    var session =
        await controller.updateSessionUser(correlationId, sessionId, user);
    timing.endTiming();
    return session;
  }

  /// Close a session by it's id.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [sessionId]                an id of the session to be closed
  /// Return                Future that receives closed session
  /// Throws error.
  @override
  Future<SessionV1> closeSession(String correlationId, String sessionId) async {
    var timing = instrument(correlationId, 'sessions.close_session');
    var session = await controller.closeSession(correlationId, sessionId);
    timing.endTiming();
    return session;
  }

  /// Deleted a session by it's unique id.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [sessionId]                an id of the session to be deleted
  /// Return                Future that receives deleted session
  /// Throws error.
  @override
  Future<SessionV1> deleteSessionById(
      String correlationId, String sessionId) async {
    var timing = instrument(correlationId, 'sessions.delete_session_by_id');
    var session = await controller.deleteSessionById(correlationId, sessionId);
    timing.endTiming();
    return session;
  }
}
