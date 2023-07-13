import 'http_router_model.dart';

/// 按模块划分的路由配置，在启动时注册所有路由
abstract class HttpRouterConfig {
  List<HttpRouterModel> get routers;
}
