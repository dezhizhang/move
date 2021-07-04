import 'package:app/core/hiNetAdapter.dart';
import 'package:app/http/request/baseRequest.dart';
import 'package:app/core/hiError.dart';

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
    HiNetResponse? response;
    var error;
    try {
      response = await send(request);
    } on HiNetError catch (e) {
      error = e;
      response = e.data;
    } catch (e) {
      error = e;
    }

    // ignore: unnecessary_null_comparison
    if (response == null) {
      print(error);
    }

    var result = response!.data;
    print(result);

    var status = response.statusCode;
    switch (status) {
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(), data: result);
      default:
        throw HiNetError(status, result.toString(), data: result);
    }
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
