import 'dart:async';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;
import 'package:args/args.dart';

import 'db/database_util.dart';
import 'extension/handler_extension.dart';
import 'router/base/constants.dart';
import 'router/base/http_method_enum.dart';
import 'router/user_router.dart';

Future<void> main(List<String> args) async {
  final webPath = getWebPathArg(args);
  print('传入的Web项目路径为: $webPath');

  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final router = shelf_router.Router(
    notFoundHandler: (_) => Response.notFound('Not Found'),
  );
  // 注册所有自定义的路由。默认给每个路由配套一个options请求，解决跨域问题
  final customRouters = [UserRouter()];
  for (final customRouter in customRouters) {
    for (final routerModel in customRouter.routers) {
      Function handler = routerModel.handler;
      if (routerModel.needAuth) {
        handler = handler.withAuth;
      }
      if (routerModel.requiredParams?.isNotEmpty ?? false) {
        handler = handler.withCheckParams(routerModel.requiredParams!);
      }
      // 加options为了解决跨域问题
      router
        ..add(
          routerModel.method.text,
          '$apiPrefix${routerModel.path}',
          handler,
        )
        ..add(
          HttpMethod.options.text,
          '$apiPrefix${routerModel.path}',
          crossHandler,
        );
    }
  }
  Cascade cascade = Cascade();
  if (webPath != null) {
    // Web项目路由
    cascade = cascade.add(getStaticHandler(webPath));
  }
  // API路由
  cascade = cascade.add(router);
  final server = await shelf_io.serve(
    logRequests().addHandler(cascade.handler).withHandleCORS,
    InternetAddress.anyIPv4,
    port,
  );
  print('Serving at http://${server.address.host}:${server.port}');
  // Used for tracking uptime of the demo server.
  _watch.start();
  DatabaseUtil().init();
}

// Serve files from the file system.
Handler getStaticHandler(String path) => shelf_static.createStaticHandler(
      path,
      serveFilesOutsidePath: true,
      defaultDocument: 'index.html',
    );

final _watch = Stopwatch();

String? getWebPathArg(List<String> args) {
  final parser = ArgParser();
  parser.addOption('webPath');
  final results = parser.parse(args);
  final webPath = results['webPath'] as String?;
  return webPath;
}

FutureOr<Response> crossHandler(Request request) => Response.ok(null);