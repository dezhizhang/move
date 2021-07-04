import 'package:app/http/request/baseRequest.dart';

class HiNet {
  HiNet._();
  static HiNet? _instance;
  static HiNet? getInstance() {
    // ignore: unnecessary_null_comparison
    if (_instance == null) {
      _instance = HiNet._();
    }
    return _instance;
  }

  Future fire(BaseRequest request) async {
    var response = await send(request);
    var result = response['data'];
    print('result:${result}');
    return result;
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    print('url:${request.url()}');
    print('method:${request.httpMethod()}');
    request.addHeader('token', '123');
    return Future.value({
      "statusCode": 200,
      "data": {"code": 0, "message": "ok"}
    });
  }
}
