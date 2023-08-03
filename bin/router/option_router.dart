import 'dart:async';

import 'package:shelf/shelf.dart';

import '../db/tables/option_table.dart';
import '../constants/constants.dart';
import '../extension/request_extension.dart';
import 'base/http_method_enum.dart';
import 'base/http_router_config.dart';
import 'base/http_router_model.dart';

/// 配置项增查
class OptionRouter extends HttpRouterConfig {
  /// 路由前缀
  final String prefix = '/option';

  /// 路由
  final String add = '/add';

  /// 参数
  static const _type = 'type';
  static const _name = 'name';
  static const _value = 'value';

  /// 新增
  Future<Response> addHandler(Request request) async {
    final params = request.params;
    final type = params[_type] as String;
    final name = params[_name] as String;
    final value = params[_value] as String?;
    await OptionQuery.addOption(name, type, value: value);
    return Response.ok(createBody());
  }

  /// 查询
  Future<Response> queryHandler(Request request) async {
    final params = request.routerParams;
    final type = params[_type] as String?;
    final options = await OptionQuery.queryOption(type: type);
    return Response.ok(createBody(body: options));
  }

  @override
  List<HttpRouterModel> get routers => [
        HttpRouterModel(
          method: HttpMethod.post,
          path: '$prefix$add',
          handler: addHandler,
          requiredParams: [_type, _name],
        ),
        HttpRouterModel(
          method: HttpMethod.get,
          path: '$prefix/<$_type>',
          handler: queryHandler,
        ),
        HttpRouterModel(
          method: HttpMethod.get,
          path: prefix,
          handler: queryHandler,
        ),
      ];
}
