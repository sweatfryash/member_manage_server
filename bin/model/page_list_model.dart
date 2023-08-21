class PageListModel<T> {
  const PageListModel({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.count,
    required this.list,
  });

  final int page;
  final int pageSize;
  final int total;
  final int count;
  final List<T> list;

  Map<String, dynamic> toJson() => {
        'page': page,
        'pageSize': pageSize,
        'total': total,
        'count': count,
        'list': list,
      };
}
