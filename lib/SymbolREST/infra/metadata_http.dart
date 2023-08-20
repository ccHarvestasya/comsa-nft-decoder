import 'package:comsa_nft_decoder/SymbolREST/infra/statistics_service_http.dart';

import '../model/metadata/metadata_entry.dart';
import '../util/address_util.dart';
import '../util/string_util.dart';
import 'https.dart';
import 'metadata_search_criteria.dart';
import 'page.dart';

class MetadataHttp {
  /// メタデータ検索
  Future<Page<MetadataEntry>> searchMetadata(
      {required MetadataSearchCriteria dto}) async {
    Map<String, dynamic> jsonData = await _searchMetadataJson(dto);

    /** Metadata Entry 生成 **/
    List<MetadataEntry> data = _createMetadataEntryList(jsonData['data']);

    /** ページネーション **/
    Page<MetadataEntry> page = Page(
      data,
      jsonData['pagination']['pageNumber'],
      jsonData['pagination']['pageSize'],
    );

    return page;
  }

  /// メタデータ取得
  Future<MetadataEntry> getMetadata({required String compositeHash}) async {
    throw Exception('未実装');
  }

  /// Metadata Entry リストリスト生成
  List<MetadataEntry> _createMetadataEntryList(List<dynamic> jsonDataList) {
    List<MetadataEntry> metadataEntryList = [];
    for (Map<String, dynamic> jsonData in jsonDataList) {
      MetadataEntry metadataEntry =
          _createMetadataEntry(jsonData['metadataEntry']);
      metadataEntryList.add(metadataEntry);
    }
    return metadataEntryList;
  }

  /// Metadata Entry クラス生成
  MetadataEntry _createMetadataEntry(Map<String, dynamic> jsonData) {
    AddressUtil addressUtil = AddressUtil();
    StringUtil stringUtil = StringUtil();

    String sourceAddress = addressUtil.convString(jsonData['sourceAddress']);
    String targetAddress = addressUtil.convString(jsonData['targetAddress']);
    String value = stringUtil.convStringUtf8(jsonData['value']);

    return MetadataEntry(
      version: jsonData['version'],
      compositeHash: jsonData['compositeHash'],
      sourceAddress: sourceAddress,
      targetAddress: targetAddress,
      scopedMetadataKey: jsonData['scopedMetadataKey'],
      targetId: jsonData['targetId'],
      metadataType: jsonData['metadataType'],
      valueSize: jsonData['valueSize'],
      value: value,
    );
  }

  /// DTOをマップに変換
  Map<String, dynamic>? _convMap(MetadataSearchCriteria dto) {
    Map<String, dynamic> params = {};

    if (dto.sourceAddress != null) {
      params['sourceAddress'] = dto.sourceAddress;
    }
    if (dto.targetAddress != null) {
      params['targetAddress'] = dto.targetAddress;
    }
    if (dto.scopedMetadataKey != null) {
      params['scopedMetadataKey'] = dto.scopedMetadataKey;
    }
    if (dto.targetId != null) {
      params['targetId'] = dto.targetId;
    }
    if (dto.metadataType != null) {
      params['metadataType'] = dto.metadataType;
    }
    if (dto.pageSize != null) {
      params['pageSize'] = dto.pageSize.toString();
    }
    if (dto.pageNumber != null) {
      params['pageNumber'] = dto.pageNumber.toString();
    }
    if (dto.offset != null) {
      params['offset'] = dto.offset.toString();
    }
    if (dto.order != null) {
      params['order'] = dto.order;
    }

    if (params.isEmpty) {
      return null;
    }
    return params;
  }

  /// メタデータJson取得
  Future<Map<String, dynamic>> _searchMetadataJson(
      MetadataSearchCriteria dto) async {
    // Https生成
    Https https = Https(
      url: StatisticsServiceHttp().getRestGatewayHost(),
      path: '/metadata',
    );
    // パラメータマップ作成
    Map<String, dynamic>? params = _convMap(dto);
    // 検索
    return await https.get(params);
  }
}
