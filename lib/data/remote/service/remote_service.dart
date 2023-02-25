import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../constants.dart';
import '../../../utils/network/api.dart';
import '../response/auth_response/login_response/login_response.dart';

class RemoteService extends GetxService {
  RemoteService() {
    if (ApiUtil.client == null) {
      ApiUtil.client = dio.Dio(
        dio.BaseOptions(
          baseUrl: baseApiUrl,
          headers: {
            HttpHeaders.acceptHeader: responseOfJsonType,
          },
        ),
      );

      ApiUtil.client!.interceptors.add(
        PrettyDioLogger(
          requestHeader: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
        ),
      );
    }
  }
//

  // Authorization
  Future<LoginResponse> getLogin(String? email, String? password,
      {String purchaseCode = purchaseCode}) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyPhone, email);
    ApiUtil.appendParamIntoData(bodyData, keyPassword, password);
    ApiUtil.appendParamIntoData(bodyData, keyIdentityMatrix, purchaseCode);

    final response = await ApiUtil.postRequest(
      endPoint: loginUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return LoginResponse.fromJson(response.data);
  }

  Future<LoginResponse> getSocialLogin({
    required String? name,
    required String? email,
    required String? provider,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyEmail, email);
    ApiUtil.appendParamIntoData(bodyData, keyName, name);
    ApiUtil.appendParamIntoData(bodyData, keyProvider, provider);

    final response = await ApiUtil.postRequest(
      endPoint: socialLoginUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return LoginResponse.fromJson(response.data);
  }
}
