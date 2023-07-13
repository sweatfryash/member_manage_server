import 'http_method_enum.dart';

class HttpRouterModel {
  const HttpRouterModel({
    required this.method,
    required this.path,
    required this.handler,
    this.needAuth = true,
    this.requiredParams,
  });

  final HttpMethod method;
  final String path;
  final Function handler;
  final bool needAuth;
  final List<String>? requiredParams;
}
