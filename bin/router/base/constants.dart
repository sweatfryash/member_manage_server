import 'dart:convert';

const apiPrefix = '/api';
const success = 'success';
const notFound = 'not found';
const notAuthed = 'not authed';
const internalError = 'server internal error';

String createBody({Object? body, String? message,int? code}) => _jsonEncode({
      'message': message ?? success,
      'data': body,
      'code': code ?? 0
    });

String _jsonEncode(Object? data) =>
    const JsonEncoder.withIndent(' ').convert(data);

const jsonHeaders = {
  'content-type': 'application/json',
};
