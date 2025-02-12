
class ErrorModel{
  final bool success;
  final int statusCode;
  final String statusMessage;

  const ErrorModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      success: json['success'],
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }

}