import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;
import 'package:args/args.dart';

Future<void> main(List<String> args) async {
  // 定义命令行参数解析器
  final parser = ArgParser();
  parser.addOption('webAppDirectoryPath');
  final results = parser.parse(args);
  final webAppDirectoryPath = results['webAppDirectoryPath'] as String?;
  if (webAppDirectoryPath == null) {
    print('请传入参数: --webAppDirectoryPath');
    return;
  }
  print('传入的参数值为: $webAppDirectoryPath');

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final cascade =
      Cascade().add(getStaticHandler(webAppDirectoryPath)).add(_router);

  // See https://pub.dev/documentation/shelf/latest/shelf_io/serve.html
  final server = await shelf_io.serve(
    logRequests().addHandler(cascade.handler),
    InternetAddress.anyIPv4,
    port,
  );

  print('Serving at http://${server.address.host}:${server.port}');
  print('Web app is at http://localhost:${server.port}');

  // Used for tracking uptime of the demo server.
  _watch.start();
}

// Serve files from the file system.
Handler getStaticHandler(String path) => shelf_static.createStaticHandler(
      path,
      serveFilesOutsidePath: true,
      defaultDocument: 'index.html',
    );

// Router instance to handler requests.
final _router = shelf_router.Router()
  ..get('/helloworld', _helloWorldHandler)
  ..get(
    '/time',
    (request) => Response.ok(DateTime.now().toLocal().toString()),
  )
  ..get('/sum/<a|[0-9]+>/<b|[0-9]+>', _sumHandler);

Response _helloWorldHandler(Request request) => Response.ok('Hello, World!');

String _jsonEncode(Object? data) =>
    const JsonEncoder.withIndent(' ').convert(data);

const _jsonHeaders = {
  'content-type': 'application/json',
};

Response _sumHandler(Request request, String a, String b) {
  final aNum = int.parse(a);
  final bNum = int.parse(b);
  return Response.ok(
    _jsonEncode({'a': aNum, 'b': bNum, 'sum': aNum + bNum}),
    headers: {
      ..._jsonHeaders,
      'Cache-Control': 'public, max-age=604800, immutable',
    },
  );
}

final _watch = Stopwatch();
