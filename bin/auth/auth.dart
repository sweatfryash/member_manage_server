import 'dart:convert';

import 'token_model.dart';
import 'package:crypto/crypto.dart';
import 'dart:math';

class AuthManager {
  static final AuthManager _instance = AuthManager._internal();

  factory AuthManager() => _instance;

  AuthManager._internal();

  final List<TokenModel> tokens = [];

  TokenModel addToken(int userId) {
    tokens.removeWhere((element) => element.userId == userId);
    final token = TokenModel(
      token: generateToken(userId),
      createTime: DateTime.now(),
      userId: userId,
    );
    tokens.add(token);
    return token;
  }

  void removeToken(String token) {
    tokens.removeWhere((element) => element.token == token);
  }

  /// 需要验证token的接口都要经过此方法
  /// -1: token不存在 -2: token过期
  int checkToken(String paramToken) {
    final token = tokens.firstWhere(
      (element) => element.token == paramToken,
      orElse: () =>
          TokenModel(token: '', createTime: DateTime.now(), userId: -1),
    );
    if (token.userId == -1) {
      return -1;
    }
    final now = DateTime.now();
    final diff = now.difference(token.createTime);
    if (diff.inDays > 30) {
      return -2;
    }
    return token.userId;
  }

  String generateToken(int userId) {
    // 获取当前时间戳
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    // 生成随机盐
    String salt = generateSalt();
    // 拼接时间戳、用户ID和盐
    String dataToHash = '$timestamp$userId$salt';
    // 使用 SHA-256 哈希函数进行加密
    List<int> bytes = utf8.encode(dataToHash);
    Digest hash = sha256.convert(bytes);
    // 将加密后的结果转换为十六进制字符串作为 token
    String token = hash.toString();
    return token;
  }

  String generateSalt() {
    const int saltLength = 16;
    Random random = Random();
    String characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String salt = '';
    for (int i = 0; i < saltLength; i++) {
      int randomIndex = random.nextInt(characters.length);
      salt += characters[randomIndex];
    }
    return salt;
  }
}
