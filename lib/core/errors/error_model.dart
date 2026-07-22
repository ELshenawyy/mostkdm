class ErrorModel {
  final String message;
  final int? statusCode;

  const ErrorModel({
    required this.message,
    this.statusCode,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'] ?? 'حدث خطأ غير متوقع',
    );
  }
}

