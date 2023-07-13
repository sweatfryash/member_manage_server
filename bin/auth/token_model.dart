class TokenModel {
  const TokenModel({
    required this.token,
    required this.createTime,
    required this.userId,
  });

  final String token;
  final DateTime createTime;
  final int userId;
}
