class ResponseConverter {
  const ResponseConverter._();

  static dynamic from<T>({
    required dynamic data,
    required Function fun,
    bool isList = false,
  }) {
    return _baseConverter<T>(data, isList, fun);
  }

  static dynamic _baseConverter<T>(body, bool isList, Function fun) {
    if (isList) {
      if (body == null) {
        return [];
      }
      final list = <T>[];
      for (var i = 0; i < body.length; i++) {
        list.add(fun(body[i]));
      }
      return list;
    } else {
      if (body == null) {
        return '';
      }
      return fun(body);
    }
  }
}
