import './statistics_service_api_status_finalization.dart';
import './statistics_service_api_status_node_status.dart';
import './statistics_service_api_status_web_socket.dart';

class ApiStatus {
  final String restGatewayUrl;
  final bool isAvailable;
  final bool isHttpsEnabled;
  final int lastStatusCheck;
  final String nodePublicKey;
  final int chainHeight;
  final int? unlockedAccountCount;
  final bool isAvailableNetworkProperties;
  final String restVersion;
  final ApiStatusWebSocket? webSocket;
  final ApiStatusFinalization? finalization;
  final ApiStatusNodeStatus? nodeStatus;

  ApiStatus({
    required this.restGatewayUrl,
    required this.isAvailable,
    required this.isHttpsEnabled,
    required this.lastStatusCheck,
    required this.nodePublicKey,
    required this.chainHeight,
    required this.unlockedAccountCount,
    required this.isAvailableNetworkProperties,
    required this.restVersion,
    this.webSocket,
    this.finalization,
    this.nodeStatus,
  });
}
