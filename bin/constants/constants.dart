import 'dart:convert';

import '../db/database.dart';

const apiPrefix = '/api';
const success = 'success';
const notFound = 'not found';
const notAuthed = 'not authed';
const internalError = 'server internal error';

/// 可自定义配置的选项类型,对应[AppOption.type]
const cardOption = 'card';
const discountOption = 'discount';
const expenseOption = 'expense';

String createBody({Object? body, String? message, int? code}) => _jsonEncode({
      'code': code ?? 0,
      'message': message ?? success,
      'data': body,
    });

String _jsonEncode(Object? data) =>
    const JsonEncoder.withIndent(' ').convert(data);

const jsonHeaders = {
  'content-type': 'application/json',
};
