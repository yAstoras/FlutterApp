// ignore_for_file: unnecessary_this

class HttpModel {
  late bool ok;
  late int code;
  late int status;
  late String message;
  late Map<String, dynamic> data;

  Map<String, String> headers = {'Content-type': 'application/json'};

  parseFromSuccess(success) {
    this.ok = true;
    this.code = success['code'];
    this.message = success['message'];
    this.data = success['data'];
  }

  parseFromError(error) {
    this.ok = false;
    this.data = {error.toString(): 'algo de errado aconteceu'};
  }
}
