import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../auth/auth.dart';
import '../router/base/constants.dart';

extension AuthExtension on Function {
  /// 验证token，如果验证通过，将userId放入header中，key为userIdPassedServerAuth
  Future<Response> auth(Request request) async {
    final token = request.headers['token'];
    if (token == null) {
      return Response.unauthorized(createBody(message: '请先登录'));
    }
    final userId = AuthManager().checkToken(token);
    if (userId < 0) {
      return Response.unauthorized(createBody(message: '登陆状态已失效，请重新登陆'));
    }
    return this
        .call(request.change(context: {'userIdPassedServerAuth': '$userId'}));
  }

  /// 跨域处理,暂时直接固定允许所有跨域
  Future<Response> handleCROS(Request request) async {
    final response = (await this.call(request)) as Response;
    return response.change(
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, DELETE, PUT',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept, token',
        'Access-Control-Allow-Credentials': 'true',
      },
    );
  }

  /// 校验参数是否为空
  Future<Response> Function(Request) checkParams(List<String> requiredParams) =>
      (Request request) async {
        final body = await request.readAsString();
        final paramsMap = Map<String, dynamic>.from(jsonDecode(body));
        for (final param in requiredParams) {
          if (paramsMap[param] == null) {
            return Response.badRequest(
              body: createBody(message: '参数错误,缺少必填参数：$param'),
            );
          }
        }
        return this.call(request.change(context: {'params': paramsMap}));
      };
}
