import 'dart:convert';
import 'package:app/http/request/baseRequest.dart';

//网络请求抽像类
abstract class HiNetAdapter {
  Future<HiNetResponse<T>> send<T>(BaseRequest request);
}

//统一网络请求返回格式
class HiNetResponse<T> {
  T data;
  late BaseRequest request;
  late int statusCode;
  late String statusMessage;
  dynamic extra;
  HiNetResponse(
      {required this.data,
      required this.request,
      required this.statusCode,
      required this.statusMessage,
      this.extra});
  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
