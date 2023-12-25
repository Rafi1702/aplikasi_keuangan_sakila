import 'package:http_interceptor/http_interceptor.dart';
import 'package:sakila_store_project/helper/shared_pref.dart';

class GlobalInterceptor implements InterceptorContract {
  GlobalInterceptor();

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final cookie = await SharedPref.getCookie();
    request.headers.addAll({
      'Content-Type': 'application/json',
      'Cookie': cookie,
    });

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async {
    // TODO: implement shouldInterceptRequest
    return true;
  }

  @override
  Future<bool> shouldInterceptResponse() async {
    // TODO: implement shouldInterceptResponse
    return true;
  }

  // @override
  // Future<BaseRequest> interceptRequest({required BaseRequest data}) async {

  //   return data;
  // }

  // @override
  // Future<BaseResponse> interceptResponse({required BaseResponse data}) async {
  //   return data;
  // }
}
