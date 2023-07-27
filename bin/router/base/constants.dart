import 'dart:convert';

const apiPrefix = '/api';
const success = 'success';
const notFound = 'not found';
const notAuthed = 'not authed';
const internalError = 'server internal error';

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
