import 'package:talos_commons/utils/call_context.dart';
import 'package:talos_commons/base_classes/base_json.dart';
import 'package:talos_commons/utils/Alerts.dart';
import 'package:talos_commons/base_classes/error_resp.dart';

String? HOSTNAME;
String? PORT;

abstract class BaseApi {
  BaseApi(
      {required this.req,
      this.showDefaultError = true,
      this.skipErrorRespCheck = false,
      this.isHttps = false});
  CallContext callContext = CallContext();
  String? url;
  late Uri uri;
  Basejson req;
  bool showDefaultError;
  bool skipErrorRespCheck;
  bool isHttps;
  String? hostName;
  String? port;

  final Map<String, String> header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'
  };

  void setBearerToken(String token) {
    header['Authorization'] = 'Bearer $token';
  }

  Future triggerCall() async {
    url = (url ?? ('${hostName ?? HOSTNAME}:${port ?? PORT}'));
    uri = isHttps ? Uri.https(url!, getEndpoint) : Uri.http(url!, getEndpoint);
    log('$getOutgressLog Calling: $uri');
    try {
      log('Request: ${req.toRawJson()}');
      final res = await restCall;
      if (res.statusCode == 200) {
        log('Response:  ${res.body}');
        if (!skipErrorRespCheck) {
          ErrorResp error = ErrorResp.fromRawJson(res.body);
          if (error.status == false) {
            callContext.setError(error.error?.errorDescription);
            if (showDefaultError) {
              showErrorAlert(
                  error.error?.errorDescription ?? 'Unknown Error Occured');
            }
            return;
          }
        }
        final resp = deserialiser(res.body);
        callContext.data = resp;
      } else if (res.statusCode == 404) {
        callContext.setError('Unable to Connect to Server');
        if (showDefaultError) showErrorAlert('Unable to Connect to Server');
      } else {
        callContext.setError(res.reasonPhrase);
        if (showDefaultError) showErrorAlert(res.reasonPhrase);
      }
    } catch (e) {
      if (showDefaultError) showErrorAlert('Unable to Connect to Server ');
      callContext.setError(e.toString());
    }
  }

  get restCall;
  Future<CallContext> call();

  String get getEndpoint;

  String get getOutgressLog;

  get deserialiser;
}
