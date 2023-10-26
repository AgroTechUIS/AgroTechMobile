class ResponseModel<T> {
  final T? response;
  final String? error;

  ResponseModel({
    this.response,
    this.error,
  });
}
