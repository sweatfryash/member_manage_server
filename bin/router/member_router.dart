import 'dart:async';

import 'package:shelf/shelf.dart';

import '../constants/constants.dart';
import '../db/queries/member_query.dart';
import '../extension/request_extension.dart';
import 'base/http_method_enum.dart';
import 'base/http_router_config.dart';
import 'base/http_router_model.dart';

/// 会员增改查
class MemberRouter extends HttpRouterConfig {
  /// 路由前缀
  final String prefix = '/member';

  /// 路由
  final String add = '/add';
  final String list = '/list';
  final String consume = '/consume';

  /// 参数
  static const _name = 'name';
  static const _phone = 'phone';
  static const _money = 'money';
  static const _discount = 'discount';
  static const _searchText = 'searchText';
  static const _page = 'page';
  static const _pageSize = 'pageSize';
  static const _id = 'id';

  /// 新增
  Future<Response> addMember(Request request) async {
    final params = request.params;
    await MemberQuery.add(
      name: params[_name],
      phone: params[_phone],
      money: params[_money],
      discount: params[_discount],
    );
    return Response.ok(createBody());
  }

  /// 查询列表
  Future<Response> memberList(Request request) async {
    final searchText = request.queryParams[_searchText];
    final page = int.tryParse(request.queryParams[_page] ?? '');
    final pageSize = int.tryParse(request.queryParams[_pageSize] ?? '');
    final members = await MemberQuery.getList(
      searchText: searchText,
      page: page,
      pageSize: pageSize,
    );
    return Response.ok(createBody(body: members));
  }

  /// 查询列表
  Future<Response> memberDetail(Request request) async {
    final member =
        await MemberQuery.getMemberById(int.parse(request.routerParams[_id]));
    if (member != null) {
      return Response.ok(createBody(body: member));
    }
    return Response.ok(createBody(code: 1, message: '会员ID不存在'));
  }

  /// 编辑，充值操作、消费操作
  @override
  List<HttpRouterModel> get routers => [
        HttpRouterModel(
          method: HttpMethod.post,
          path: '$prefix$add',
          handler: addMember,
          requiredParams: [_name, _phone, _money, _discount],
        ),
        HttpRouterModel(
          method: HttpMethod.get,
          path: '$prefix$list',
          handler: memberList,
        ),
        HttpRouterModel(
          method: HttpMethod.get,
          path: '$prefix/<$_id>',
          handler: memberDetail,
        ),
      ];
}
