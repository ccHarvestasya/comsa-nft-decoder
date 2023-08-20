import 'package:comsa_nft_decoder/SymbolREST/infra/metadata_http.dart';
import 'package:comsa_nft_decoder/SymbolREST/infra/metadata_search_criteria.dart';
import 'package:comsa_nft_decoder/SymbolREST/infra/page.dart';
import 'package:comsa_nft_decoder/SymbolREST/infra/statistics_service_http.dart';
import 'package:comsa_nft_decoder/SymbolREST/model/metadata/metadata_entry.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  final clientSS = MockClient(
    (request) async {
      return http.Response(
        '''
        [
            {
                "_id": "64e182b3990c73001209c6e3",
                "version": 16777990,
                "publicKey": "E6E9B7E431B828FE5D47354203382DBF168E488F5E761CABC8C5B7801D8D0EA5",
                "networkGenerationHashSeed": "57F7DA205008026C776CB6AED843393F04CD458E0AA2D9F1D5F31A402072B2D6",
                "roles": 7,
                "port": 7900,
                "networkIdentifier": 104,
                "host": "004symbol.open-nodes.com",
                "friendlyName": "With me !",
                "lastAvailable": "2023-08-20T03:04:19.135Z",
                "hostDetail": {
                    "host": "004symbol.open-nodes.com",
                    "coordinates": {
                        "latitude": 35.6893,
                        "longitude": 139.6899
                    },
                    "location": "Tokyo, 13, Japan",
                    "ip": "160.16.75.88",
                    "organization": "SAKURA Internet Inc.",
                    "as": "AS9370 SAKURA Internet Inc.",
                    "continent": "Asia",
                    "country": "Japan",
                    "region": "13",
                    "city": "Tokyo",
                    "district": "",
                    "zip": "102-0082"
                },
                "peerStatus": {
                    "isAvailable": true,
                    "lastStatusCheck": 1692500269406
                },
                "apiStatus": {
                    "restGatewayUrl": "https://004symbol.open-nodes.com:3001",
                    "isAvailable": true,
                    "isHttpsEnabled": true,
                    "lastStatusCheck": 1692500271119,
                    "webSocket": {
                        "isAvailable": true,
                        "wss": true,
                        "url": "wss://004symbol.open-nodes.com:3001/ws"
                    },
                    "nodePublicKey": "543312C2987CC98087C7244153F15C242FCA62F32AD2FC91816C4EE86A671936",
                    "chainHeight": 2549749,
                    "finalization": {
                        "height": 2549720,
                        "epoch": 1772,
                        "point": 45,
                        "hash": "051771FEE1BC9103657D926A8660DA0DDD8FC91EC70FE6C7D4BD615EBEFA8CCF"
                    },
                    "unlockedAccountCount": 7,
                    "isAvailableNetworkProperties": true,
                    "nodeStatus": {
                        "apiNode": "up",
                        "db": "up"
                    },
                    "restVersion": "2.4.3"
                },
                "certificateExpiration": "2023-10-16T15:19:11.000Z",
                "__v": 0
            },
            {
                "_id": "64e182b3990c73001209c72b",
                "version": 16777990,
                "publicKey": "5C406E4EAB44A5764001D1BE6CF88ADA1338ED8800B2772FD8DC9540161B7BDC",
                "networkGenerationHashSeed": "57F7DA205008026C776CB6AED843393F04CD458E0AA2D9F1D5F31A402072B2D6",
                "roles": 3,
                "port": 7900,
                "networkIdentifier": 104,
                "host": "0-0-0-0-0-0-0.harvesting.fan",
                "friendlyName": "0-0-0-0-0-0-0.Harvesting.Fan",
                "lastAvailable": "2023-08-20T03:04:19.136Z",
                "hostDetail": {
                    "host": "0-0-0-0-0-0-0.harvesting.fan",
                    "coordinates": {
                        "latitude": 50.1049,
                        "longitude": 8.6295
                    },
                    "location": "Frankfurt am Main, HE, Germany",
                    "ip": "178.18.242.112",
                    "organization": "Inline Internet Online Dienste GmbH",
                    "as": "AS51167 Contabo GmbH",
                    "continent": "Europe",
                    "country": "Germany",
                    "region": "HE",
                    "city": "Frankfurt am Main",
                    "district": "",
                    "zip": "60326"
                },
                "peerStatus": {
                    "isAvailable": true,
                    "lastStatusCheck": 1692500328773
                },
                "apiStatus": {
                    "restGatewayUrl": "https://0-0-0-0-0-0-0.harvesting.fan:3001",
                    "isAvailable": true,
                    "isHttpsEnabled": true,
                    "lastStatusCheck": 1692500328857,
                    "webSocket": {
                        "isAvailable": true,
                        "wss": true,
                        "url": "wss://0-0-0-0-0-0-0.harvesting.fan:3001/ws"
                    },
                    "nodePublicKey": "0DF4FDC50FC8CCD2C9A0A7684D370735657E0C0A7B7229DBCF182BAE7955D800",
                    "chainHeight": 2549750,
                    "finalization": {
                        "height": 2549720,
                        "epoch": 1772,
                        "point": 45,
                        "hash": "051771FEE1BC9103657D926A8660DA0DDD8FC91EC70FE6C7D4BD615EBEFA8CCF"
                    },
                    "unlockedAccountCount": 2,
                    "isAvailableNetworkProperties": true,
                    "nodeStatus": {
                        "apiNode": "up",
                        "db": "up"
                    },
                    "restVersion": "2.4.3"
                },
                "certificateExpiration": "2024-04-27T14:01:06.000Z",
                "__v": 0
            }
        ]
        ''',
        200,
        headers: {'content-type': 'text/html; charset=utf-8'},
      );
    },
  );

  final clientNormal = MockClient(
    (request) async {
      return http.Response(
        '''
        {
            "data": [
                {
                    "metadataEntry": {
                        "version": 1,
                        "compositeHash": "FAB8434B94C7731A48F33AE2ED8D4EF66F238C2E0B7DE92B688DAF9DA143C671",
                        "sourceAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "targetAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "scopedMetadataKey": "C66A4EBE09577AF6",
                        "targetId": "0F82D168E703BC51",
                        "metadataType": 1,
                        "valueSize": 68,
                        "value": "5B2243394145454535304445424542413735414546434145343239323445384445304136414132384635373642324430393539363730384546373230314542373236225D"
                    },
                    "id": "6224AF794955FCE25EF075C0"
                },
                {
                    "metadataEntry": {
                        "version": 1,
                        "compositeHash": "C30A09EEBDF937DAD98D8152C446E16936EB8038DE09A04CA3D84A0DE8050E8B",
                        "sourceAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "targetAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "scopedMetadataKey": "DA030AA7795EBE75",
                        "targetId": "0F82D168E703BC51",
                        "metadataType": 1,
                        "valueSize": 326,
                        "value": "7B2276657273696F6E223A22636F6D73612D6E66742D312E30222C226E616D65223A22373336463735373034393445353433333332222C227469746C65223A223433373237393730373436463230343736393732364337333230323333303334222C2268617368223A2264643061383834346435306533356630656135646135633832333061636238303565323764386363356332643132373939396636653338626261386132356666222C2274797065223A224E4654222C226D696D655F74797065223A22696D6167652F6A706567222C226D65646961223A22696D616765222C2261646472657373223A224E425A4F374144454141565A46484D4D573559354D5457534955484E5A4A4C4F484743345A3751222C226D6F73616963223A2230463832443136384537303342433531222C22656E646F72736572223A2273686F686569227D"
                    },
                    "id": "6224AF794955FCE25EF075C1"
                },
                {
                    "metadataEntry": {
                        "version": 1,
                        "compositeHash": "6E161FB9627353523409A5D3A756B1C0B2A35075039EF270C178F1DFFBDBEB8D",
                        "sourceAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "targetAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "scopedMetadataKey": "B4F07181247C4201",
                        "targetId": "0F82D168E703BC51",
                        "metadataType": 1,
                        "valueSize": 1,
                        "value": "31"
                    },
                    "id": "6224AF794955FCE25EF075C2"
                },
                {
                    "metadataEntry": {
                        "version": 1,
                        "compositeHash": "5BD0D044C91A1D9B9BD82079A6E591A7F5B84FEAB37E1F5ED83817F2D8DAC892",
                        "sourceAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "targetAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "scopedMetadataKey": "FE58A23DBB642C67",
                        "targetId": "0F82D168E703BC51",
                        "metadataType": 1,
                        "valueSize": 2,
                        "value": "3135"
                    },
                    "id": "6224AF794955FCE25EF075C3"
                },
                {
                    "metadataEntry": {
                        "version": 1,
                        "compositeHash": "CA21DC8BB3E83027F520DAF0AA3C91ED5A68D88A51E2AB0006014032A0D34A16",
                        "sourceAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "targetAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "scopedMetadataKey": "AD05EB49A5415213",
                        "targetId": "0F82D168E703BC51",
                        "metadataType": 1,
                        "valueSize": 146,
                        "value": "3534363836353230343836463643373932303438364637323645304130414537413539444537413638464533383239324533383138324533383141414533383139464533383141424533383038323041304133323330333233323245333033333245333033343041343337323635363137343635363432303632373932303533364637353730323034333638363136453245"
                    },
                    "id": "6224AF794955FCE25EF075C5"
                },
                {
                    "metadataEntry": {
                        "version": 1,
                        "compositeHash": "8C1A093BE2DF5945F78DD943BEAE319885311AF29E68EA6A989434E8B0C85449",
                        "sourceAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "targetAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "scopedMetadataKey": "89BCD45087AF19BF",
                        "targetId": "0F82D168E703BC51",
                        "metadataType": 1,
                        "valueSize": 6,
                        "value": "73686F686569"
                    },
                    "id": "6224AF794955FCE25EF075C7"
                },
                {
                    "metadataEntry": {
                        "version": 1,
                        "compositeHash": "F82BCE655C627DBEA26B2CF34AC66829D70F93D1B326BC9776DBBBE5B148E61E",
                        "sourceAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "targetAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "scopedMetadataKey": "8D9A3BDD21391AA2",
                        "targetId": "0F82D168E703BC51",
                        "metadataType": 1,
                        "valueSize": 13,
                        "value": "636F6D73612D6E66742D312E30"
                    },
                    "id": "6224AF794955FCE25EF075C8"
                },
                {
                    "metadataEntry": {
                        "version": 1,
                        "compositeHash": "E28A62092067597D4D5241745555BB71D02E72AD8F864B0BE0B6E8E0A93B36FE",
                        "sourceAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "targetAddress": "686CAB4F4761FE018B2ED187905C97B8D1272A0E2C87BC58",
                        "scopedMetadataKey": "D77BFE313AF3EF1F",
                        "targetId": "0F82D168E703BC51",
                        "metadataType": 1,
                        "valueSize": 1006,
                        "value": "5B2245323935324343443842333237423333384337333839323736413846463531393636333536413438434235364342443531384535423439344334354645393039222C2241374536343638314638384645384144303535443944383733314637424132324635394541363641463944453542433330334435433537324341333339383443222C2236343034364244413142433841303836443141344637354339393342443834383435434231453345414538434434414237464542363031453842354335374537222C2234423737384239314445463331464438394542363039394435423039393034353041334446324632413744374231373331414136313841303136393446313537222C2234453743323034424530364237334331374144423336304341303439394136443841353233444436303239344141443733333344313346384132424345373742222C2235413437374632443045393734413032353737364637393330363139424531343634444139344245314434464437433330324641323031323844334441304436222C2241413431343343453339313130433939363445443241423142333136353543443841313630393946424643373435463330414437413842354236373537303537222C2236413641463546384544314442413838434144443645353241323034443541314644304335323943363745313334434635423635424634313633464336314432222C2236433234324441363634423830363738463937394245393542373639453039384633453046373835313845373941313730343242424136313138453139343238222C2233324242343744393432363030453638463130414135373742353330323636334534413830374335393745413639303332313531354234323738323538453537222C2243464636353536384535343239413237333141444541313042433633443132324146423141353730344445313931333942424138343043413438354230433741222C2246413333453830334238354334443732443646463032444136313844414439454646314337314643433737383536443345344245364331353944433232313645222C2241463433394335383931363331424638343438324637463342334439354135444232373639443731313732313641423843313437433636463836383044463341222C2239324645303836443739323831384231333734454345373830413239423942453241374531413730454534383833353645443431453045323438303535383831222C2237394434323838343439373141363133383435314439464542383332444245433145414445433342314531363233433138394533304437373142463543383343225D"
                    },
                    "id": "6224AF794955FCE25EF075C9"
                }
            ],
            "pagination": {
                "pageNumber": 1,
                "pageSize": 20
            }
        }
        ''',
        200,
        headers: {'content-type': 'text/html; charset=utf-8'},
      );
    },
  );

  test('Metadata 検索 成功', () async {
    await http.runWithClient(() async {
      StatisticsServiceHttp ss = StatisticsServiceHttp();
      await ss.init();
    }, () => clientSS);
    Page<MetadataEntry> metadataEntryPage = await http.runWithClient(() async {
      MetadataHttp metadataHttp = MetadataHttp();
      return await metadataHttp.searchMetadata(
          dto: MetadataSearchCriteria(targetId: '0F82D168E703BC51'));
    }, () => clientNormal);

    // ページ確認
    expect(metadataEntryPage.pageNumber, 1);
    expect(metadataEntryPage.pageSize, 20);
    expect(metadataEntryPage.isLastPage, isTrue);

    // データ確認
    List<MetadataEntry> metadataEntry = metadataEntryPage.data;
    expect(metadataEntry, isNotEmpty);
    expect(metadataEntry, isList);
    expect(metadataEntry.length, 8);
  });
}
