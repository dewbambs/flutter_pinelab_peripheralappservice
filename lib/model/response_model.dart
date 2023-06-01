// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/foundation.dart';

/// converts pinelabs response to dart object
@immutable
class ResponseModel {
  /// converts pinelabs response to dart object
  /// [operationType] is the operation code of the response.
  /// [responseCode] is the response code of the response.
  /// [responseMsg] is the response message of the response.
  /// [rawResponse] is the string response received from pinelabs.
  const ResponseModel({
    required this.operationType,
    required this.responseCode,
    required this.responseMsg,
    this.rawResponse = '',
  });

  /// get [ResponseModel] from [map].
  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    final code = map['ResponseCode'];
    final operationType = map['OperationType'];

    return ResponseModel(
      operationType: operationType is int
          ? operationType
          : int.tryParse(operationType) ?? 0,
      responseCode: code is int ? code : int.tryParse(code) ?? 0,
      responseMsg: map['ResponseMessage'] ?? '',
      rawResponse: json.encode(map),
    );
  }

  /// get [ResponseModel] from [json] string.
  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source));

  /// [operationType] is the opeation code of the response.
  final int operationType;

  /// [responseCode] is the response code of the response.
  final int responseCode;

  /// [responseMsg] is the response message of the response.
  final String responseMsg;

  /// [rawResponse] is the string response received from pinelabs.
  final String rawResponse;

  /// get map from [ResponseModel].
  Map<String, dynamic> toMap() {
    return json.decode(rawResponse);
  }

  /// get json string from [ResponseModel].
  String toJson() => json.encode(toMap());

  /// copy new instance of [ResponseModel].
  ResponseModel copyWith({
    int? operationType,
    int? responseCode,
    String? responseMsg,
    String? rawResponse,
  }) {
    return ResponseModel(
      operationType: operationType ?? this.operationType,
      responseCode: responseCode ?? this.responseCode,
      responseMsg: responseMsg ?? this.responseMsg,
      rawResponse: rawResponse ?? this.rawResponse,
    );
  }

  @override
  String toString() {
    return '''ResponseModel(operationType: $operationType, responseCode: $responseCode, responseMsg: $responseMsg, rawResponse: $rawResponse)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseModel &&
        other.operationType == operationType &&
        other.responseCode == responseCode &&
        other.responseMsg == responseMsg &&
        // remove all whitespace from rawResponse
        other.rawResponse.replaceAll(RegExp(r'\s+'), '') ==
            rawResponse.replaceAll(RegExp(r'\s+'), '');
  }

  @override
  int get hashCode {
    return operationType.hashCode ^
        responseCode.hashCode ^
        responseMsg.hashCode ^
        rawResponse.hashCode;
  }
}
