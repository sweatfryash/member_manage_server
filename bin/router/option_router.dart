import 'dart:async';

import 'package:shelf/shelf.dart';

import '../db/tables/option_table.dart';
import '../constants/constants.dart';
import 'base/http_method_enum.dart';
import 'base/http_router_config.dart';
import 'base/http_router_model.dart';

/// 用户相关
class OptionRouter extends HttpRouterConfig {
  /// 路由前缀
  final String base = '/option';

  /// 路由
  final String add = '/add';
  final String all = '/all';

  /// 参数
  static const _type = 'type';
  static const _name = 'name';
  static const _value = 'value';

  /// 新增
  Future<Response> addHandler(Request request) async {
    final params = request.context['params'] as Map<String, dynamic>;
    final type = params[_type] as String;
    final name = params[_name] as String;
    final value = params[_value] as String?;
    await OptionQuery.addOption(name, type, value: value);
    return Response.ok(createBody());
  }

  /// 查询v
  Future<Response> queryHandler(Request request) async {
    final params = request.context['shelf_router/params'] as Map<String, dynamic>;
    final type = params[_type] as String?;
    final options = await OptionQuery.queryOption(type: type);
    return Response.ok(createBody(body: options));
  }

  @override
  List<HttpRouterModel> get routers => [
        HttpRouterModel(
          method: HttpMethod.post,
          path: '$base$add',
          handler: addHandler,
          requiredParams: [_type, _name],
        ),
        HttpRouterModel(
          method: HttpMethod.get,
          path: '$base/<$_type>',
          handler: queryHandler,
        ),
        HttpRouterModel(
          method: HttpMethod.get,
          path: base,
          handler: queryHandler,
        ),
      ];
}
