import 'dart:async';
import 'dart:convert';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import './SessionV1.dart';
import './ISessionsClientV1.dart';

class SessionsHttpClientV1 extends CommandableHttpClient
    implements ISessionsClientV1 {
  SessionsHttpClientV1([config]) : super('v1/sessions') {
    if (config != null) {
      configure(ConfigParams.fromValue(config));
    }
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
    var result = await callCommand(
      'get_sessions',
      correlationId,
      {'filter': filter, 'paging': paging},
    );
    return DataPage<SessionV1>.fromJson(json.decode(result), (item) {
      var session = SessionV1();
      session.fromJson(item);
      return session;
    });
  }

  /// Gets a session by its unique id.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [sessionId]                an id of session to be retrieved.
  /// Return         Future that receives session or error.
  @override
  Future<SessionV1> getSessionById(
      String correlationId, String sessionId) async {
    var result = await callCommand(
        'get_session_by_id', correlationId, {'session_id': sessionId});
    if (result == null) return null;
    var item = SessionV1();
    item.fromJson(json.decode(result));
    return item;
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
    var result = await callCommand('open_session', correlationId, {
      'user_id': user_id,
      'user_name': user_name,
      'address': address,
      'client': client,
      'user': user,
      'data': data
    });
    if (result == null) return null;
    var item = SessionV1();
    item.fromJson(json.decode(result));
    return item;
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
    var result = await callCommand('store_session_data', correlationId,
        {'session_id': sessionId, 'data': data});
    if (result == null) return null;
    var item = SessionV1();
    item.fromJson(json.decode(result));
    return item;
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
    var result = await callCommand('update_session_user', correlationId,
        {'session_id': sessionId, 'user': user});
    if (result == null) return null;
    var item = SessionV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Close a session by it's id.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [sessionId]                an id of the session to be closed
  /// Return                Future that receives closed session
  /// Throws error.
  @override
  Future<SessionV1> closeSession(String correlationId, String sessionId) async {
    var result = await callCommand(
        'close_session', correlationId, {'session_id': sessionId});
    if (result == null) return null;
    var item = SessionV1();
    item.fromJson(json.decode(result));
    return item;
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
    var result = await callCommand(
        'delete_session_by_id', correlationId, {'session_id': sessionId});
    if (result == null) return null;
    var item = SessionV1();
    item.fromJson(json.decode(result));
    return item;
  }
}
