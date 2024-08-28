class ApiErrorModel {
  final int code;
  final String message;

  ApiErrorModel({required this.code, required this.message});

  ApiErrorModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['detail'];
}