// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/foundation.dart';

/// converts pinelabs response to dart object
@immutable
class ScanResponseModel {
  /// converts pinelabs response to dart object
  /// [operationType] is the operation code of the response.
  /// [responseCode] is the response code of the response.
  /// [responseMsg] is the response message of the response.
  /// [rawResponse] is the string response received from pinelabs.
  const ScanResponseModel({
    required this.operationType,
    required this.responseCode,
    required this.responseMsg,
    required this.scannedData,
    this.rawResponse = '',
  });

  /// get [ScanResponseModel] from [map].
  factory ScanResponseModel.fromMap(Map<String, dynamic> map) {
    final code = map['ResponseCode'];
    final operationType = map['OperationType'];

    return ScanResponseModel(
      operationType: operationType is int
          ? operationType
          : int.tryParse(operationType) ?? 0,
      responseCode: code is int ? code : int.tryParse(code) ?? 0,
      responseMsg: map['ResponseMessage'] ?? '',
      scannedData: map['ScannedData'] ?? '',
      rawResponse: json.encode(map),
    );
  }

  /// get [ScanResponseModel] from [json] string.
  factory ScanResponseModel.fromJson(String source) =>
      ScanResponseModel.fromMap(json.decode(source));

  /// [operationType] is the opeation code of the response.
  final int operationType;

  /// [responseCode] is the response code of the response.
  final int responseCode;

  /// [responseMsg] is the response message of the response.
  final String responseMsg;

  /// [rawResponse] is the string response received from pinelabs.
  final String rawResponse;

  /// [scannedData] is the response of the scanned product
  final String scannedData;

  /// get map from [ScanResponseModel].
  Map<String, dynamic> toMap() {
    return json.decode(rawResponse);
  }

  /// get json string from [ScanResponseModel].
  String toJson() => json.encode(toMap());

  /// copy new instance of [ScanResponseModel].
  ScanResponseModel copyWith({
    int? operationType,
    int? responseCode,
    String? responseMsg,
    String? rawResponse,
    String? scannedData,
  }) {
    return ScanResponseModel(
      operationType: operationType ?? this.operationType,
      responseCode: responseCode ?? this.responseCode,
      responseMsg: responseMsg ?? this.responseMsg,
      rawResponse: rawResponse ?? this.rawResponse,
      scannedData: scannedData ?? this.scannedData,
    );
  }

  @override
  String toString() {
    return '''ResponseModel(operationType: $operationType, responseCode: $responseCode, responseMsg: $responseMsg, scannedData: $scannedData, rawResponse: $rawResponse)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScanResponseModel &&
        other.operationType == operationType &&
        other.responseCode == responseCode &&
        other.responseMsg == responseMsg &&
        other.scannedData == scannedData &&
        // remove all whitespace from rawResponse
        other.rawResponse.replaceAll(RegExp(r'\s+'), '') ==
            rawResponse.replaceAll(RegExp(r'\s+'), '');
  }

  @override
  int get hashCode {
    return operationType.hashCode ^
        responseCode.hashCode ^
        responseMsg.hashCode ^
        scannedData.hashCode ^
        rawResponse.hashCode;
  }
}
