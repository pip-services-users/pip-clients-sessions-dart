import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import '../version1/SessionsNullClientV1.dart';
import '../version1/SessionsDirectClientV1.dart';
import '../version1/SessionsHttpClientV1.dart';

class SessionsClientFactory extends Factory {
  static final NullClientDescriptor =
      Descriptor('pip-services-sessions', 'client', 'null', '*', '1.0');
  static final DirectClientDescriptor =
      Descriptor('pip-services-sessions', 'client', 'direct', '*', '1.0');
  static final HttpClientDescriptor =
      Descriptor('pip-services-sessions', 'client', 'http', '*', '1.0');

  SessionsClientFactory() : super() {
    registerAsType(
        SessionsClientFactory.NullClientDescriptor, SessionsNullClientV1);
    registerAsType(
        SessionsClientFactory.DirectClientDescriptor, SessionsDirectClientV1);
    registerAsType(
        SessionsClientFactory.HttpClientDescriptor, SessionsHttpClientV1);
  }
}
