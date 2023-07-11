A simple Dart HTTP server for the member manage application.
会员管理系统的后端代码，使用dart。

编译时要注意，编译的产物只能在与当前机器相同架构的机器运行。
比如在MacOS上编译的产物只能在MacOS上运行，不能在Linux上运行。
个人流程是push 项目代码，服务器pull之后编译一下运行。

更新依赖、编译、运行操作如下

```bash
$ dart pub get
$ dart compile exe bin/server.dart
$ bin/server.exe --webAppDirectoryPath=/xxx/web/
```
其中，webAppDirectoryPath是前端代码的目录，/xxx/web/ 这个目录下面应该有index.html文件，根据实际情况填写。

空项目是复制的官方的demo，docker不会用，配置文件啥的先放着。