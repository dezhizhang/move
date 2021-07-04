enum HttpMethod { GET, POST, DELETE }

// 基础请求
abstract class BaseRequest {
  var pathPrams;
  var useHtttps = true;
  String authority() {
    return 'xiaozhi.shop';
  }

  HttpMethod httpMethod();
  String path();
  String url() {
    Uri uri;
    // ignore: unused_local_variable
    var pathStr = path();
    if (pathPrams != null) {
      if (path().endsWith('/')) {
        pathStr = '${path()}$pathPrams';
      } else {
        pathStr = '${path()}/$pathPrams';
      }
    }
    // http和http切换
    if (useHtttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    print('--------------');
    print(uri.toString());
    print('--------------');
    return url.toString();
  }

  //是否需要登录
  bool needLogin();
  Map<String, String> params = Map();
  //添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  //添加header
  Map<String, String> header = Map();
  BaseRequest addHeader(String k, Object v) {
    params[k] = v.toString();
    return this;
  }
}
