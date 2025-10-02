import 'package:flutter_dotenv/flutter_dotenv.dart';

const API_CONNECT_TIMEOUT_DEFAULT = 30;
const API_RECEIVER_TIMEOUT_DEFAULT = 30;
const API_SEND_TIMEOUT_DEFAULT = 30;

const INSTANCE_AUTH_DIO = "AUTH_DIO";
const INSTANCE_UNAUTH_DIO = "UNAUTH_DIO";

class EnvNetwork {
  final String apiServer;
  final int apiConnectTimeout;
  final int apiReceiverTimeout;
  final int apiSendTimeout;
  final String? apiContentType;

  EnvNetwork({
    required this.apiServer,
    required this.apiConnectTimeout,
    required this.apiReceiverTimeout,
    required this.apiSendTimeout,
    required this.apiContentType,
  });

// api_server = ""
// api_connect_timeout = 30
// api_receiver_timeout = 30
// api_send_timeout = 30
// api_content_type = "application/json"
  static EnvNetwork envNetworkFromConfigure() {
    final apiServer = dotenv.get(
      "api_server",
      fallback: "",
    );
    final apiConnectTimeout = API_CONNECT_TIMEOUT_DEFAULT;
    final apiReceiverTimeout = API_RECEIVER_TIMEOUT_DEFAULT;
    final apiSendTimeout = API_SEND_TIMEOUT_DEFAULT;
    final apiContentType = dotenv.get("api_content_type");

    return EnvNetwork(
        apiServer: apiServer,
        apiConnectTimeout: apiConnectTimeout,
        apiReceiverTimeout: apiReceiverTimeout,
        apiSendTimeout: apiSendTimeout,
        apiContentType: apiContentType);
  }
}
