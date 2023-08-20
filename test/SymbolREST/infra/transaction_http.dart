import 'package:comsa_nft_decoder/SymbolREST/infra/statistics_service_http.dart';
import 'package:comsa_nft_decoder/SymbolREST/infra/transaction_http.dart';
import 'package:comsa_nft_decoder/SymbolREST/model/transaction/aggregate_transaction.dart';
import 'package:comsa_nft_decoder/SymbolREST/model/transaction/aggregate_transaction_info.dart';
import 'package:comsa_nft_decoder/SymbolREST/model/transaction/transaction.dart';
import 'package:comsa_nft_decoder/SymbolREST/model/transaction/transfer_transaction.dart';
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
            "meta": {
                "height": "2550434",
                "hash": "EABF396F0BD8704C1582C7A15B5876F32D5B2D1938C549C00BDE3A3E18780531",
                "merkleComponentHash": "578A6F7DA907B3DF57745127EF473604A6AC44979113453D1DC42BCFF209F0B7",
                "index": 0,
                "timestamp": "76667466069",
                "feeMultiplier": 100
            },
            "transaction": {
                "size": 368,
                "signature": "AD3C5AF614CE4ABE5449A868FDDDF5020FC2C4EA7C9FE42349F6BEE16EC0CA267235EF89A78EA39F82551F7FBD3EF117661FAF0BDE19452708FF509C669B490F",
                "signerPublicKey": "12DF16F6DC102B9BB17C450E56315E63EEEDCC3E7E6692B37C9A0B1C22D93DCD",
                "version": 2,
                "network": 104,
                "type": 16705,
                "maxFee": "36800",
                "deadline": "76688958369",
                "transactionsHash": "85192B619E325CD2B761D1B481CE73389BFD9FCF7E8EF643DB642DEE45637285",
                "cosignatures": [
                    {
                        "version": "0",
                        "signerPublicKey": "032613603350D19639891C5D96DF55BDB7FD4CFBE03BAC367760E1C78C614EA9",
                        "signature": "3EF34C74DF42AE595E67C8A7FFD30F1D2FE370981817F74C06BA5649210432AC5EB7A4D16E8AEC7A1D93E16C49C279559B1CE7EE974D41DFF8EDADCD0D3ABC00"
                    }
                ],
                "transactions": [
                    {
                        "meta": {
                            "height": "2550434",
                            "aggregateHash": "EABF396F0BD8704C1582C7A15B5876F32D5B2D1938C549C00BDE3A3E18780531",
                            "aggregateId": "64E1D0C9588C273D79250824",
                            "index": 0,
                            "timestamp": "76667466069",
                            "feeMultiplier": 100
                        },
                        "transaction": {
                            "signerPublicKey": "179DE5E32109AE013AF001934D6522DAE459A23C67981973E61CD5D1685D007D",
                            "version": 1,
                            "network": 104,
                            "type": 16724,
                            "recipientAddress": "685196962F3CB7ADD6150E2F8B40F074B46009411490B94A",
                            "mosaics": [
                                {
                                    "id": "6BED913FA20223F8",
                                    "amount": "160000000"
                                }
                            ]
                        },
                        "id": "64E1D0C9588C273D79250825"
                    }
                ]
            },
            "id": "64E1D0C9588C273D79250824"
        }
        ''',
        200,
        headers: {'content-type': 'text/html; charset=utf-8'},
      );
    },
  );

  test('承認済アグリゲートトランザクション検索 成功', () async {
    await http.runWithClient(() async {
      StatisticsServiceHttp ss = StatisticsServiceHttp();
      await ss.init();
    }, () => clientSS);

    Transaction tx = await http.runWithClient(() async {
      TransactionHttp txHttp = TransactionHttp();
      return await txHttp.getConfirmedTx(
          'EABF396F0BD8704C1582C7A15B5876F32D5B2D1938C549C00BDE3A3E18780531');
    }, () => clientNormal);

    AggregateTransaction aggregateTx = tx as AggregateTransaction;

    // データ確認
    expect(aggregateTx.transactionInfo!.height, '2550434');
    expect(aggregateTx.transactionInfo!.hash,
        'EABF396F0BD8704C1582C7A15B5876F32D5B2D1938C549C00BDE3A3E18780531');
    expect(aggregateTx.transactionInfo!.merkleComponentHash,
        '578A6F7DA907B3DF57745127EF473604A6AC44979113453D1DC42BCFF209F0B7');
    expect(aggregateTx.transactionInfo!.index, 0);
    expect(aggregateTx.transactionInfo!.timestamp, '76667466069');
    expect(aggregateTx.transactionInfo!.feeMultiplier, 100);

    expect(aggregateTx.size, 368);
    expect(aggregateTx.signature,
        'AD3C5AF614CE4ABE5449A868FDDDF5020FC2C4EA7C9FE42349F6BEE16EC0CA267235EF89A78EA39F82551F7FBD3EF117661FAF0BDE19452708FF509C669B490F');
    expect(aggregateTx.signerPublicKey,
        '12DF16F6DC102B9BB17C450E56315E63EEEDCC3E7E6692B37C9A0B1C22D93DCD');
    expect(aggregateTx.version, 2);
    expect(aggregateTx.network, 104);
    expect(aggregateTx.type, 16705);
    expect(aggregateTx.maxFee, '36800');
    expect(aggregateTx.deadline, '76688958369');
    expect(aggregateTx.transactionsHash,
        '85192B619E325CD2B761D1B481CE73389BFD9FCF7E8EF643DB642DEE45637285');

    expect(aggregateTx.cosignatures[0].version, '0');
    expect(aggregateTx.cosignatures[0].signerPublicKey,
        '032613603350D19639891C5D96DF55BDB7FD4CFBE03BAC367760E1C78C614EA9');
    expect(aggregateTx.cosignatures[0].signature,
        '3EF34C74DF42AE595E67C8A7FFD30F1D2FE370981817F74C06BA5649210432AC5EB7A4D16E8AEC7A1D93E16C49C279559B1CE7EE974D41DFF8EDADCD0D3ABC00');

    AggregateTransactionInfo aggregateTransactionInfo = aggregateTx
        .innerTransaction[0].transactionInfo as AggregateTransactionInfo;
    expect(aggregateTransactionInfo.height, '2550434');
    expect(aggregateTransactionInfo.aggregateHash,
        'EABF396F0BD8704C1582C7A15B5876F32D5B2D1938C549C00BDE3A3E18780531');
    expect(aggregateTransactionInfo.aggregateId, '64E1D0C9588C273D79250824');
    expect(aggregateTransactionInfo.index, 0);
    expect(aggregateTransactionInfo.timestamp, '76667466069');
    expect(aggregateTransactionInfo.feeMultiplier, 100);

    TransferTransaction transferTx =
        aggregateTx.innerTransaction[0] as TransferTransaction;
    expect(transferTx.signerPublicKey,
        '179DE5E32109AE013AF001934D6522DAE459A23C67981973E61CD5D1685D007D');
    expect(transferTx.version, 1);
    expect(transferTx.network, 104);
    expect(transferTx.type, 16724);
    expect(transferTx.recipientAddress,
        '685196962F3CB7ADD6150E2F8B40F074B46009411490B94A');

    expect(transferTx.mosaics[0].id, '6BED913FA20223F8');
    expect(transferTx.mosaics[0].amount, '160000000');
  });
}
