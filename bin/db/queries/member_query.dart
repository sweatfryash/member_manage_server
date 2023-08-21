import 'package:drift/drift.dart';

import '../../model/page_list_model.dart';
import '../database.dart';
import 'query_util.dart';

/// 会员表的相关查询
class MemberQuery {
  /// 新增
  static Future<int> add({
    required String name,
    required String phone,
    required double money,
    required int discount,
  }) =>
      MyDatabase().into(MyDatabase().members).insert(
            MembersCompanion(
              name: Value<String>(name),
              phone: Value<String>(phone),
              money: Value<double>(money),
              discount: Value<int>(discount),
              createTime:
                  Value<String>(DateTime.now().toString().split('.').first),
            ),
          );

  /// 搜索查询,筛选姓名或者手机号
  static Future<PageListModel<Member>> getList({
    String? searchText,
    int? page,
    int? pageSize,
  }) async => QueryUtil.pageListQuery<$MembersTable, Member>(
      table: MyDatabase().members,
      countColumn: MyDatabase().members.id,
      query: (query) {
        if (searchText != null) {
          query = query
            ..where(
              (member) =>
                  member.name.contains(searchText) |
                  member.phone.contains(searchText),
            );
        }
        return query;
      },
    );

  /// 会员详情
  static Future<Member?> getMemberById(int id) {
    final query = MyDatabase().select(MyDatabase().members)
      ..where((member) => member.id.equals(id));
    return query.getSingleOrNull();
  }
}
