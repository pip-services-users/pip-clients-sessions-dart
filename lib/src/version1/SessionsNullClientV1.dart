import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import './SessionV1.dart';
import './ISessionsClientV1.dart';

class SessionsNullClientV1 implements ISessionsClientV1 {
  @override
  Future<DataPage<SessionV1>> getSessions(
      String correlationId, FilterParams filter, PagingParams paging) async {
    return DataPage<SessionV1>([], 0);
  }

  @override
  Future<SessionV1> getSessionById(
      String correlationId, String sessionId) async {
    return null;
  }

  @override
  Future<SessionV1> openSession(String correlationId, String user_id,
      String user_name, String address, String client, user, data) {
    return null;
  }

  @override
  Future<SessionV1> storeSessionData(
      String correlationId, String sessionId, data) {
    return null;
  }

  @override
  Future<SessionV1> updateSessionUser(
      String correlationId, String sessionId, user) {
    return null;
  }

  @override
  Future<SessionV1> closeSession(String correlationId, String sessionId) {
    return null;
  }

  @override
  Future<SessionV1> deleteSessionById(String correlationId, String sessionId) {
    return null;
  }
}
