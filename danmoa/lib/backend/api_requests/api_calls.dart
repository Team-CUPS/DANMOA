import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class DKULoginForAuthenticationCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? userPassword = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DKU login for authentication',
      apiUrl: 'https://nlms.dankook.ac.kr/sso/sso_index.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'user_id': userId,
        'user_password': userPassword,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PictureCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'picture',
      apiUrl:
          'https://firebasestorage.googleapis.com/v0/b/danmoa-p5plsh.appspot.com/o/users%2FefiSKK3SihNLfm4dMM1JA4rvEf12%2Fuploads%2F1712368528678000.png?alt=media&token=355b748f-7398-4c79-bd62-c12152b80e18',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
