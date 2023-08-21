import 'package:drift/drift.dart';

import '../../model/page_list_model.dart';
import '../database.dart';

class QueryUtil {
  QueryUtil._();

  /// 分页查询包装
  /// [table] 查询的表 [countColumn] 查询总数量的字段，一般就用表的ID
  static Future<PageListModel<R>> pageListQuery<T extends HasResultSet, R>({
    required ResultSetImplementation<T, R> table,
    required GeneratedColumn countColumn,
    SimpleSelectStatement<T, R> Function(SimpleSelectStatement<T, R>)? query,
    int? page,
    int? pageSize,
  }) async {
    page ??= 0;
    pageSize ??= 10;
    var countExpression = countColumn.count();
    final countQuery = MyDatabase().selectOnly(table)
      ..addColumns([countExpression]);
    final count = (await countQuery
            .map((row) => row.read(countExpression))
            .getSingle()) ??
        0;
    var listQuery = MyDatabase().select(table);
    if (query != null) {
      listQuery = query(listQuery);
    }
    listQuery = listQuery..limit(pageSize, offset: pageSize * page);
    final list = await listQuery.get();
    final total = (count / pageSize).ceil();
    return PageListModel<R>(
      page: page,
      pageSize: pageSize,
      total: total,
      count: count,
      list: list,
    );
  }
}
