class ApiResponse<T> {
  final String? message;
  final bool success;
  final T? data;
  ApiResponse({
    this.message,
    required this.success,
    this.data,
  });

  factory ApiResponse.success(T data, [String? message]) {
    return ApiResponse(message: message, success: true, data: data);
  }

  factory ApiResponse.failure(String message) {
    return ApiResponse(message: message, success: false);
  }
}
