import 'dart:math';

import 'package:big_decimal/big_decimal.dart';

import '../model/statistics_service/statistics_service.dart';
import '../model/statistics_service/statistics_service_api_status.dart';
import '../model/statistics_service/statistics_service_api_status_finalization.dart';
import '../model/statistics_service/statistics_service_api_status_node_status.dart';
import '../model/statistics_service/statistics_service_api_status_web_socket.dart';
import '../model/statistics_service/statistics_service_host_detail.dart';
import '../model/statistics_service/statistics_service_host_detail_coordinates.dart';
import '../model/statistics_service/statistics_service_peer_status.dart';
import '../symbol_rest_prop.dart';
import 'https.dart';

/// Statistics Service を管理するクラス
class StatisticsServiceHttp {
  /// インスタンス
  static final StatisticsServiceHttp _instance =
      StatisticsServiceHttp._internal();

  /// Statistics Service Json
  List<dynamic> _ssJsonList = [];

  /// Statistics Service クラス
  final List<StatisticsService> _ssList = [];

  /// パブリックコンストラクタ
  factory StatisticsServiceHttp() {
    return _instance;
  }

  /// プライベートコンストラクタ
  StatisticsServiceHttp._internal();

  /// 初期処理
  init() async {
    // Statistics Service Nodes Json 取得
    _ssJsonList = await _getNodesJson();

    if (_ssJsonList.isEmpty) {
      // Statistics Service Json が空
      throw Exception('Statistics Service の値が空です');
    }

    // Jsonをクラス化
    _convStatisticsServiceClassList();
  }

  /// Statistics Service クラス取得
  List<StatisticsService> getStatisticsServiceList() {
    return _ssList;
  }

  /// ランダムRestゲートウェイ取得
  String randomRestGatewayHost() {
    if (_ssList.isEmpty) {
      throw Exception('Statistics Service クラスが初期化されていません');
    }

    String? restGatewayUrl;
    int retry = 0;
    while (retry < 5 && restGatewayUrl == null) {
      // ランダムに取得
      StatisticsService ss = _ssList[Random().nextInt(_ssList.length)];
      restGatewayUrl = ss.apiStatus?.restGatewayUrl;
      retry++;
    }
    if (restGatewayUrl == null) {
      throw Exception('Rest GateWay Url が取得出来ません');
    }
    return restGatewayUrl;
  }

  /// Statistics Service Jsonをクラスに変換
  void _convStatisticsServiceClassList() {
    for (Map<String, dynamic> ss in _ssJsonList) {
      /** Peer Status **/
      PeerStatus? peerStatus;
      if (ss['peerStatus'] != null) {
        peerStatus = PeerStatus(
          isAvailable: ss['peerStatus']['isAvailable'],
          lastStatusCheck: ss['peerStatus']['lastStatusCheck'],
        );
      }
      /** Api Status **/
      ApiStatus? apiStatus;
      if (ss['apiStatus'] != null) {
        ApiStatusWebSocket? apiStatusWebSocket;
        if (ss['apiStatus']['webSocket'] != null) {
          apiStatusWebSocket = ApiStatusWebSocket(
            isAvailable: ss['apiStatus']['webSocket']['isAvailable'],
            wss: ss['apiStatus']['webSocket']['wss'],
            url: ss['apiStatus']['webSocket']['url'],
          );
        }
        ApiStatusFinalization? apiStatusFinalization;
        if (ss['apiStatus']['finalization'] != null) {
          apiStatusFinalization = ApiStatusFinalization(
            height: ss['apiStatus']['finalization']['height'],
            epoch: ss['apiStatus']['finalization']['epoch'],
            point: ss['apiStatus']['finalization']['point'],
            hash: ss['apiStatus']['finalization']['hash'],
          );
        }
        ApiStatusNodeStatus? apiStatusNodeStatus;
        if (ss['apiStatus']['nodeStatus'] != null) {
          apiStatusNodeStatus = ApiStatusNodeStatus(
            apiNode: ss['apiStatus']['nodeStatus']['apiNode'],
            db: ss['apiStatus']['nodeStatus']['db'],
          );
        }
        apiStatus = ApiStatus(
          restGatewayUrl: ss['apiStatus']['restGatewayUrl'],
          isAvailable: ss['apiStatus']['isAvailable'],
          isHttpsEnabled: ss['apiStatus']['isHttpsEnabled'],
          lastStatusCheck: ss['apiStatus']['lastStatusCheck'],
          nodePublicKey: ss['apiStatus']['nodePublicKey'],
          chainHeight: ss['apiStatus']['chainHeight'],
          unlockedAccountCount: ss['apiStatus']['unlockedAccountCount'],
          isAvailableNetworkProperties: ss['apiStatus']
              ['isAvailableNetworkProperties'],
          restVersion: ss['apiStatus']['restVersion'],
          webSocket: apiStatusWebSocket,
          finalization: apiStatusFinalization,
          nodeStatus: apiStatusNodeStatus,
        );
      }
      /** Host Detail **/
      HostDetail? hostDetail;
      if (ss.containsKey('hostDetail')) {
        HostDetailCoordinates? hostDetailCoordinates;
        if (ss['hostDetail']['coordinates'] != null) {
          hostDetailCoordinates = HostDetailCoordinates(
            latitude: BigDecimal.parse(
                ss['hostDetail']['coordinates']['latitude'].toString()),
            longitude: BigDecimal.parse(
                ss['hostDetail']['coordinates']['longitude'].toString()),
          );
        }
        hostDetail = HostDetail(
          host: ss['hostDetail']['host'],
          location: ss['hostDetail']['location'],
          ip: ss['hostDetail']['ip'],
          organization: ss['hostDetail']['organization'],
          as: ss['hostDetail']['as'],
          continent: ss['hostDetail']['continent'],
          country: ss['hostDetail']['country'],
          region: ss['hostDetail']['region'],
          city: ss['hostDetail']['city'],
          district: ss['hostDetail']['district'],
          zip: ss['hostDetail']['zip'],
          coordinates: hostDetailCoordinates,
        );
      }

      _ssList.add(StatisticsService(
        version: ss['version'],
        publicKey: ss['publicKey'],
        networkGenerationHashSeed: ss['networkGenerationHashSeed'],
        roles: ss['roles'],
        port: ss['port'],
        networkIdentifier: ss['networkIdentifier'],
        host: ss['host'],
        friendlyName: ss['friendlyName'],
        lastAvailable: DateTime.parse(ss['lastAvailable']),
        peerStatus: peerStatus,
        apiStatus: apiStatus,
        hostDetail: hostDetail,
      ));
    }
  }

  /// ノードJson取得
  Future<List<dynamic>> _getNodesJson() async {
    Https https = Https(
      url: SymbolRestProp.statisticsServiceHost,
      path: '${SymbolRestProp.statisticsServicePath}/nodes',
    );

    Map<String, dynamic> params = {
      'limit': SymbolRestProp.statisticsServiceNodesLimit.toString(),
      'order': 'random',
      'ssl': 'true',
    };

    return await https.get(params);
  }
}
