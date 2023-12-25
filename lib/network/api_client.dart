import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:sakila_store_project/network/global_interceptor.dart';

class HttpClient {
  static Client client = InterceptedClient.build(interceptors: [
    GlobalInterceptor(),
  ]);
}
