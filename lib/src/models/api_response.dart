import 'dart:convert';

///[ApiResponse] is the api data model to save and retrieve from local disk
class ApiResponse {
  ///[ApiResponse] is the api data model to save and retrieve from local disk
  ApiResponse({
    required this.body,
    required this.baseUrl,
    required this.path,
    required this.method,
    required this.statusCode,
    required this.connectionTimeout,
    required this.contentType,
    required this.headers,
    required this.queryParameters,
    required this.receiveTimeout,
    required this.request,
    required this.requestSize,
    required this.requestTime,
    required this.responseSize,
    required this.responseTime,
    required this.responseType,
    required this.sendTimeout,
    required this.checked,
    required this.clientLibrary,
  });

  ///Convert json to [ApiResponse]
  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        body: json['body'] as dynamic,
        baseUrl: json['baseUrl'] as String,
        method: json['method'] as String,
        statusCode: json['statusCode'] as int,
        connectionTimeout: json['connectionTimeout'] as int,
        contentType: json['contentType'] as String?,
        headers: json['headers'] as String,
        queryParameters: json['queryParameters'] as String,
        receiveTimeout: json['receiveTimeout'] as int,
        request: json['request'] as dynamic,
        requestSize: json['requestSize'] as double,
        requestTime: DateTime.parse(json['requestTime'] as String),
        responseSize: json['responseSize'] as double,
        responseTime: DateTime.parse(json['responseTime'] as String),
        responseType: json['responseType'] as String,
        sendTimeout: json['sendTimeout'] as int,
        path: json['path'] as String,
        checked: json['checked'] as bool? ?? false,
        clientLibrary: (json['clientLibrary'] as String?) ?? 'N/A',
      );

  ///Mocked instance of [ApiResponse]. ***ONLY FOR TESTING****
  factory ApiResponse.mock() => ApiResponse(
        body: {'': ''},
        baseUrl: '',
        path: '',
        method: 'GET',
        statusCode: 200,
        connectionTimeout: 0,
        contentType: 'application/json',
        headers: '',
        queryParameters: '',
        receiveTimeout: 0,
        request: {'': ''},
        requestSize: 0,
        requestTime: DateTime.now(),
        responseSize: 0,
        responseTime: DateTime.now(),
        responseType: 'json',
        sendTimeout: 0,
        checked: false,
        clientLibrary: '',
      );

  ///DateTime when request is sent
  final DateTime requestTime;

  ///DateTime when response is received
  final DateTime responseTime;

  /// Request base url, it can contain sub path.
  final String baseUrl;

  /// Api end-point
  final String path;

  ///Http method such `GET`
  final String method;

  ///Http status code. For more details, visit [https://developer.mozilla.org/en-US/docs/Web/HTTP/Status]
  final int statusCode;

  ///Size of request data
  final double requestSize;

  ///Size of response data
  final double responseSize;

  ///Request data
  final dynamic request;

  ///Response data
  final dynamic body;

  ///Request data type
  final String? contentType;

  ///Request headers
  final String headers;

  ///Timeout in milliseconds for sending data
  final int sendTimeout;

  ///Response data type
  final String responseType;

  ///Timeout in milliseconds for receiving data
  final int receiveTimeout;

  ///Request query params
  final String queryParameters;

  ///Timeout in milliseconds for making connection
  final int connectionTimeout;

  ///To check whether user has selected this instance or not
  final bool checked;

  ///The client which is used for network call
  final String clientLibrary;

  ///Convert [ApiResponse] to json.
  Map<String, dynamic> toJson() {
    return {
      'body': body,
      'connectionTimeout': connectionTimeout,
      'contentType': contentType,
      'headers': headers,
      'method': method,
      'queryParameters': queryParameters,
      'receiveTimeout': receiveTimeout,
      'request': request,
      'requestSize': requestSize,
      'requestTime': requestTime.toIso8601String(),
      'responseSize': responseSize,
      'responseTime': responseTime.toIso8601String(),
      'responseType': responseType,
      'sendTimeout': sendTimeout,
      'statusCode': statusCode,
      'baseUrl': baseUrl,
      'path': path,
      'checked': checked,
      'clientLibrary': clientLibrary,
    };
  }

  ///Copies current data and returns new object
  ApiResponse copyWith({
    DateTime? requestTime,
    DateTime? responseTime,
    String? baseUrl,
    String? path,
    String? method,
    int? statusCode,
    double? requestSize,
    double? responseSize,
    dynamic request,
    String? response,
    dynamic body,
    String? contentType,
    String? headers,
    int? sendTimeout,
    String? responseType,
    int? receiveTimeout,
    String? queryParameters,
    int? connectionTimeout,
    bool? checked,
    String? clientLibrary,
  }) {
    return ApiResponse(
      body: body ?? this.body,
      baseUrl: baseUrl ?? this.baseUrl,
      path: path ?? this.path,
      method: method ?? this.method,
      statusCode: statusCode ?? this.statusCode,
      connectionTimeout: connectionTimeout ?? this.connectionTimeout,
      contentType: contentType ?? this.contentType,
      headers: headers ?? this.headers,
      queryParameters: queryParameters ?? this.queryParameters,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      request: request ?? this.request,
      requestSize: requestSize ?? this.requestSize,
      requestTime: requestTime ?? this.requestTime,
      responseSize: responseSize ?? this.responseSize,
      responseTime: responseTime ?? this.responseTime,
      responseType: responseType ?? this.responseType,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      checked: checked ?? this.checked,
      clientLibrary: clientLibrary ?? this.clientLibrary,
    );
  }

  @override
  String toString() {
    return '''
***************** Overview *****************
Base URL: $baseUrl
Path: $path
Method: $method
Status Code: $statusCode
Request Time: $requestTime
Response Time: $responseTime
Headers: $headers
Query Params: $queryParameters
Content Type: $contentType
Response Type: $responseType
Connection Timeout: $connectionTimeout ms
Receive Timeout: $receiveTimeout ms
Send Timeout: $sendTimeout ms
Client Library: $clientLibrary

***************** Request *****************

$prettyJsonRequest

***************** Response *****************

$prettyJson''';
  }

  ///Formatted json response string
  String get prettyJson {
    return const JsonEncoder.withIndent('     ').convert(body);
  }

  ///Formatted json response string
  String get prettyJsonRequest {
    return const JsonEncoder.withIndent('     ').convert(request);
  }

  @override

  ///Equates [other] to this
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is ApiResponse && other.requestTime == requestTime;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => requestTime.millisecondsSinceEpoch;

  String getCurl() {
    // Constructing the cURL command

    var url = '$baseUrl$path';

    // Adding query parameters to the URL
    if (queryParameters.isNotEmpty) {
      final queryParams = Map.fromEntries(
        queryParameters
            .replaceAll(RegExp(r'[\{\}]'), '') // Remove curly braces
            .split(', ') // Split by comma and space
            .map((pair) =>
                pair.split(': ')) // Split each pair by colon and space
            .map((keyValue) {
          if (keyValue.length == 1 && keyValue.first == '') {
            return const MapEntry('', '');
          }
          return MapEntry(keyValue[0], keyValue[1]);
        }),
      );

      if (queryParams.entries.length == 1 &&
          queryParams.entries.first.key == '' &&
          queryParams.entries.first.value == '') {
        url += Uri(queryParameters: queryParams).query;
      } else {
        url += '?${Uri(queryParameters: queryParams).query}';
      }
    }

    var curlCommand = 'curl -X $method "$url" \\\n';

    // Adding headers to the cURL command
    if (headers.isNotEmpty) {
      List<String> pairs = headers.replaceAll(RegExp(r'[{}]+'), '').split(', ');

      Map<String, String> jsonMap = {};

      for (String pair in pairs) {
        List<String> keyValue = pair.split(': ');

        jsonMap[keyValue[0]] = keyValue[1];
      }

      jsonMap.forEach((key, value) {
        curlCommand += '  -H "$key: $value" \\\n';
      });
    }

    // Adding request body to the cURL command if it exists
    if (request != null) {
      final requestBody = json.encode(request);
      curlCommand += '  --data \'$requestBody\'';
    }

    return curlCommand;
  }

  Map<String, String> parseQueryString(String queryString) {
    return Map.fromEntries(queryString
        .replaceAll(RegExp(r'[\{\}]'), '') // Remove curly braces
        .split(', ') // Split by comma and space
        .map((pair) => pair.split(': ')) // Split each pair by colon and space
        .map((keyValue) => MapEntry(
            keyValue[0], keyValue[1]))); // Create MapEntry for each pair
  }
}
