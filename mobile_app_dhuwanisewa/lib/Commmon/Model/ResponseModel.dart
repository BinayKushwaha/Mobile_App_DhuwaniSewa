class ResponseModel {
  String status;
  String message;
  dynamic data;
  ResponseModel(
      {required this.status, required this.message, required this.data});

  factory ResponseModel.fromJson(Map<String, dynamic> data) {
    return ResponseModel(
        status: data["status"], message: data["message"], data: data["data"]);
  }
}
