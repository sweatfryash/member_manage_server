import 'package:shelf/shelf.dart';

extension Requestextension on Request {
  int get userId {
    final userId =
        int.parse(context['userIdPassedServerAuth'] as String? ?? '-1');
    if (userId < 0) {
      throw Exception('该request未经过token验证,不能直接获取userId');
    }
    return userId;
  }

  String get token {
    final token = headers['token'];
    if (token == null) {
      throw Exception('该request未经过token验证,不能直接获取token');
    }
    return token;
  }
}
