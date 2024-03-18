import 'package:talos_commons/utils/Alerts.dart';

class CallContext {
  String? _message;
  bool isError = false;
  dynamic data;

  String? get message => _message;

  void setError(String? msg) {
    log(msg);
    _message = msg;
    isError = true;
  }

  void setSuccess(String msg) {
    log(msg);
    _message = msg;
    isError = false;
  }

  void showConfirmationAlerts() {}
}
