import 'package:comsa_nft_decoder/SymbolREST/infra/statistics_service_http.dart';
import 'package:comsa_nft_decoder/SymbolREST/model/statistics_service/statistics_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  final clientNormal = MockClient(
    (request) async {
      return http.Response(
        '''
        [
            {
                "_id": "64e049b7bafcac0012f79648",
                "version": 16777990,
                "publicKey": "0A42B826851D24084EE42A5A3E0AB0B98E98C230B4CC6D10FC34B4C085B7F744",
                "networkGenerationHashSeed": "57F7DA205008026C776CB6AED843393F04CD458E0AA2D9F1D5F31A402072B2D6",
                "roles": 3,
                "port": 7900,
                "networkIdentifier": 104,
                "host": "0-0-0-0-0-0-0-0-8.tokyo-node.jp",
                "friendlyName": "0-0-0-0-0-0-0-0-8.Tokyo-Node.JP",
                "lastAvailable": "2023-08-19T04:48:54.908Z",
                "hostDetail": {
                    "host": "0-0-0-0-0-0-0-0-8.tokyo-node.jp",
                    "coordinates": {
                        "latitude": 49.405,
                        "longitude": 11.1617
                    },
                    "location": "Nuremberg, BY, Germany",
                    "ip": "207.180.196.169",
                    "organization": "Contabo GmbH",
                    "as": "AS51167 Contabo GmbH",
                    "continent": "Europe",
                    "country": "Germany",
                    "region": "BY",
                    "city": "Nuremberg",
                    "district": "",
                    "zip": "90475"
                },
                "peerStatus": {
                    "isAvailable": true,
                    "lastStatusCheck": 1692419710988
                },
                "apiStatus": {
                    "restGatewayUrl": "https://0-0-0-0-0-0-0-0-8.tokyo-node.jp:3001",
                    "isAvailable": true,
                    "isHttpsEnabled": true,
                    "lastStatusCheck": 1692419711202,
                    "webSocket": {
                        "isAvailable": true,
                        "wss": true,
                        "url": "wss://0-0-0-0-0-0-0-0-8.tokyo-node.jp:3001/ws"
                    },
                    "nodePublicKey": "95ECE5317064BEDDFD5E049EF6134CEF57921B164B61640CDF2C543B91FA1295",
                    "chainHeight": 2547069,
                    "finalization": {
                        "height": 2547044,
                        "epoch": 1770,
                        "point": 55,
                        "hash": "1155C1BE179D7E6BFC094C22A6BA126CE4FFCBD0497B1A0B769CF30B984601E3"
                    },
                    "unlockedAccountCount": 3,
                    "isAvailableNetworkProperties": true,
                    "nodeStatus": {
                        "apiNode": "up",
                        "db": "up"
                    },
                    "restVersion": "2.4.3"
                },
                "certificateExpiration": "2024-04-27T13:13:00.000Z",
                "__v": 0
            },
            {
                "_id": "64e049b7bafcac0012f79881",
                "version": 16777990,
                "publicKey": "944F3ECCFA529DD5AF8AF67D16C277E8BFB267105582A9B24CB97C1A5731905D",
                "networkGenerationHashSeed": "57F7DA205008026C776CB6AED843393F04CD458E0AA2D9F1D5F31A402072B2D6",
                "roles": 7,
                "port": 7900,
                "networkIdentifier": 104,
                "host": "xym7.allnodes.me",
                "friendlyName": "Allnodes7",
                "lastAvailable": "2023-08-19T04:48:54.908Z",
                "hostDetail": {
                    "host": "xym7.allnodes.me",
                    "coordinates": {
                        "latitude": 50.475,
                        "longitude": 12.365
                    },
                    "location": "Falkenstein, SN, Germany",
                    "ip": "188.40.163.5",
                    "organization": "",
                    "as": "AS24940 Hetzner Online GmbH",
                    "continent": "Europe",
                    "country": "Germany",
                    "region": "SN",
                    "city": "Falkenstein",
                    "district": "",
                    "zip": "08223"
                },
                "peerStatus": {
                    "isAvailable": true,
                    "lastStatusCheck": 1692420187178
                },
                "apiStatus": {
                    "restGatewayUrl": "https://xym7.allnodes.me:3001",
                    "isAvailable": true,
                    "isHttpsEnabled": true,
                    "lastStatusCheck": 1692420187350,
                    "webSocket": {
                        "isAvailable": true,
                        "wss": true,
                        "url": "wss://xym7.allnodes.me:3001/ws"
                    },
                    "nodePublicKey": "3D8DA5EA18A4C417086B0C0AA7F1D1C68FD61FF2CFEA3E2012863FF23911CC5A",
                    "chainHeight": 2547084,
                    "finalization": {
                        "height": 2547060,
                        "epoch": 1770,
                        "point": 56,
                        "hash": "686DB2A4A64B376EC04B80293243846192CF4AB9DC2E6A18A14D30A1AA37D3CF"
                    },
                    "unlockedAccountCount": 13,
                    "isAvailableNetworkProperties": true,
                    "nodeStatus": {
                        "apiNode": "up",
                        "db": "up"
                    },
                    "restVersion": "2.4.3"
                },
                "votingKeyEndEpoch": 1818,
                "certificateExpiration": "2024-05-13T12:51:27.000Z",
                "__v": 0
            },
            {
                "_id": "64e049b7bafcac0012f79796",
                "version": 16777990,
                "publicKey": "96ABC8A18686094F27E45D333D1CBFE0C0F090CFFC0566A72077931BC142DCB7",
                "networkGenerationHashSeed": "57F7DA205008026C776CB6AED843393F04CD458E0AA2D9F1D5F31A402072B2D6",
                "roles": 3,
                "port": 7900,
                "networkIdentifier": 104,
                "host": "xym180.allnodes.me",
                "friendlyName": "Allnodes180",
                "lastAvailable": "2023-08-19T04:48:54.908Z",
                "hostDetail": {
                    "host": "xym180.allnodes.me",
                    "coordinates": {
                        "latitude": 49.1156,
                        "longitude": 10.7511
                    },
                    "location": "Gunzenhausen, BY, Germany",
                    "ip": "23.88.21.76",
                    "organization": "Hetzner",
                    "as": "AS24940 Hetzner Online GmbH",
                    "continent": "Europe",
                    "country": "Germany",
                    "region": "BY",
                    "city": "Gunzenhausen",
                    "district": "",
                    "zip": "91710"
                },
                "peerStatus": {
                    "isAvailable": true,
                    "lastStatusCheck": 1692419952830
                },
                "apiStatus": {
                    "restGatewayUrl": "https://xym180.allnodes.me:3001",
                    "isAvailable": true,
                    "isHttpsEnabled": true,
                    "lastStatusCheck": 1692419953004,
                    "webSocket": {
                        "isAvailable": true,
                        "wss": true,
                        "url": "wss://xym180.allnodes.me:3001/ws"
                    },
                    "nodePublicKey": "65268A5444DBF6A3D474AEC60FB3C0DDDF2961667C832D5E7AD5287571737412",
                    "chainHeight": 2547077,
                    "finalization": {
                        "height": 2547044,
                        "epoch": 1770,
                        "point": 55,
                        "hash": "1155C1BE179D7E6BFC094C22A6BA126CE4FFCBD0497B1A0B769CF30B984601E3"
                    },
                    "unlockedAccountCount": 9,
                    "isAvailableNetworkProperties": true,
                    "nodeStatus": {
                        "apiNode": "up",
                        "db": "up"
                    },
                    "restVersion": "2.4.3"
                },
                "certificateExpiration": "2024-05-13T11:53:01.000Z",
                "__v": 0
            }
        ]
        ''',
        200,
        headers: {'content-type': 'text/html; charset=utf-8'},
      );
    },
  );

  final clientSingle = MockClient(
    (request) async {
      return http.Response(
        '''
        [
            {
                "_id": "64e049b7bafcac0012f79648",
                "version": 16777990,
                "publicKey": "0A42B826851D24084EE42A5A3E0AB0B98E98C230B4CC6D10FC34B4C085B7F744",
                "networkGenerationHashSeed": "57F7DA205008026C776CB6AED843393F04CD458E0AA2D9F1D5F31A402072B2D6",
                "roles": 3,
                "port": 7900,
                "networkIdentifier": 104,
                "host": "0-0-0-0-0-0-0-0-8.tokyo-node.jp",
                "friendlyName": "0-0-0-0-0-0-0-0-8.Tokyo-Node.JP",
                "lastAvailable": "2023-08-19T04:48:54.908Z",
                "hostDetail": {
                    "host": "0-0-0-0-0-0-0-0-8.tokyo-node.jp",
                    "coordinates": {
                        "latitude": 49.405,
                        "longitude": 11.1617
                    },
                    "location": "Nuremberg, BY, Germany",
                    "ip": "207.180.196.169",
                    "organization": "Contabo GmbH",
                    "as": "AS51167 Contabo GmbH",
                    "continent": "Europe",
                    "country": "Germany",
                    "region": "BY",
                    "city": "Nuremberg",
                    "district": "",
                    "zip": "90475"
                },
                "peerStatus": {
                    "isAvailable": true,
                    "lastStatusCheck": 1692419710988
                },
                "apiStatus": {
                    "restGatewayUrl": "https://0-0-0-0-0-0-0-0-8.tokyo-node.jp:3001",
                    "isAvailable": true,
                    "isHttpsEnabled": true,
                    "lastStatusCheck": 1692419711202,
                    "webSocket": {
                        "isAvailable": true,
                        "wss": true,
                        "url": "wss://0-0-0-0-0-0-0-0-8.tokyo-node.jp:3001/ws"
                    },
                    "nodePublicKey": "95ECE5317064BEDDFD5E049EF6134CEF57921B164B61640CDF2C543B91FA1295",
                    "chainHeight": 2547069,
                    "finalization": {
                        "height": 2547044,
                        "epoch": 1770,
                        "point": 55,
                        "hash": "1155C1BE179D7E6BFC094C22A6BA126CE4FFCBD0497B1A0B769CF30B984601E3"
                    },
                    "unlockedAccountCount": 3,
                    "isAvailableNetworkProperties": true,
                    "nodeStatus": {
                        "apiNode": "up",
                        "db": "up"
                    },
                    "restVersion": "2.4.3"
                },
                "certificateExpiration": "2024-04-27T13:13:00.000Z",
                "__v": 0
            }
        ]
        ''',
        200,
        headers: {'content-type': 'text/html; charset=utf-8'},
      );
    },
  );

  final clientEmpty = MockClient(
    (request) async {
      return http.Response(
        '[]',
        200,
        headers: {'content-type': 'text/html; charset=utf-8'},
      );
    },
  );

  final clientError = MockClient(
    (request) async {
      return http.Response(
        '',
        404,
        headers: {'content-type': 'text/html; charset=utf-8'},
      );
    },
  );

  test('Statistics Service 初期化 成功', () async {
    await http.runWithClient(() async {
      StatisticsServiceHttp ssHttp = StatisticsServiceHttp();
      await ssHttp.init();
    }, () => clientNormal);

    StatisticsServiceHttp ssHttp = StatisticsServiceHttp();
    List<StatisticsService> statisticsServiceList =
        ssHttp.getStatisticsServiceList();

    expect(statisticsServiceList, isNotEmpty);
    expect(statisticsServiceList, isList);
    expect(statisticsServiceList.length, 3);
  });

  test('Statistics Service 初期化 値空', () async {
    await http.runWithClient(() async {
      StatisticsServiceHttp ssHttp = StatisticsServiceHttp();
      expect(() => ssHttp.init(), throwsException);
    }, () => clientEmpty);
  });

  test('Statistics Service 初期化 HTTPエラー', () async {
    await http.runWithClient(() async {
      StatisticsServiceHttp ssHttp = StatisticsServiceHttp();
      expect(() => ssHttp.init(), throwsException);
    }, () => clientError);
  });

  test('Statistics Service ランダム取得 成功', () async {
    await http.runWithClient(() async {
      StatisticsServiceHttp ssHttp = StatisticsServiceHttp();
      await ssHttp.init();
    }, () => clientSingle);

    StatisticsServiceHttp ssHttp = StatisticsServiceHttp();
    String restGatewayHost = ssHttp.getRestGatewayHost();

    expect(restGatewayHost, 'https://0-0-0-0-0-0-0-0-8.tokyo-node.jp:3001');
  });
}
