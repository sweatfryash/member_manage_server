import 'dart:async';

import 'package:shelf/shelf.dart';

import '../auth/auth.dart';
import '../extension/request_extension.dart';
import 'base/constants.dart';
import 'base/http_method_enum.dart';
import 'base/http_router_config.dart';
import 'base/http_router_model.dart';

/// 用户相关
class UserRouter extends HttpRouterConfig {
  /// 路由前缀
  final String base = '/user';

  /// 路由
  final String login = '/login';
  final String logout = '/logout';

  /// 参数
  static const _username = 'username';
  static const _password = 'password';

  /// 登录
  Future<Response> loginHandler(Request request) async {
    final params = request.context['params'] as Map<String, dynamic>;
    if (params[_username] != 'hch' || params[_password] != '123456') {
      return Response.ok(createBody(message: '账号或者密码错误，请重试', code: 1));
    }
    final tokenModel = AuthManager().addToken(1);
    return Response.ok(
      createBody(body: {'name': '张三', 'age': 18}),
      headers: {'token': tokenModel.token},
    );
  }

  /// 登出
  FutureOr<Response> logoutHandler(Request request) {
    AuthManager().removeToken(request.token);
    return Response.ok(createBody());
  }

  @override
  List<HttpRouterModel> get routers => [
        HttpRouterModel(
          method: HttpMethod.post,
          path: '$base$login',
          handler: loginHandler,
          needAuth: false,
          requiredParams: [_username, _password],
        ),
        HttpRouterModel(
          method: HttpMethod.post,
          path: '$base$logout',
          handler: logoutHandler,
        ),
      ];
}
