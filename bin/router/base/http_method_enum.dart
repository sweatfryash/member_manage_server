enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch,
  options,
  head,
  connect,
  trace,
}

extension HttpMethodEnumExtension on HttpMethod {
  String get text {
    switch (this) {
      case HttpMethod.get:
        return 'get';
      case HttpMethod.post:
        return 'post';
      case HttpMethod.put:
        return 'put';
      case HttpMethod.delete:
        return 'delete';
      case HttpMethod.patch:
        return 'patch';
      case HttpMethod.options:
        return 'options';
      case HttpMethod.head:
        return 'head';
      case HttpMethod.connect:
        return 'connect';
      case HttpMethod.trace:
        return 'trace';
    }
  }
}
