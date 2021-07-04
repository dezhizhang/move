import 'package:app/http/request/baseRequest.dart';

class TestRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    // TODO: implement needLogin
    return false;
  }

  @override
  String path() {
    // TODO: implement path
    return 'uapi/test/test';
  }
}
