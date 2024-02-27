import 'dart:developer';

/// External packages
///
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ssc/app.dart';

const kNawyApiKey = '';
const kFCMTopic = 'FCM_TOPIC';
const arHeader = 'ar-SA';
const enHeader = 'en';

const demoNumber = '500000000';

final serverErrorProvider = StateProvider<int>((ref) => 200);
final dioProvider = Provider<Dio>(
  (ref) {
    final baseUrl = ref.read(configProvider).apiURL;
    debugPrint(baseUrl);

    String? acceptedLanguage;

    // final locale = ref.watch(localizationsProvider);

    // acceptedLanguage = locale.isArabic ? arHeader : enHeader;

    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        // connectTimeout: 15000,
        // receiveTimeout: 15000,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': "Bearer $token",
          'Accept-Language': acceptedLanguage
        },
      ),
    )..interceptors.addAll([
        SessionExpiredInterceptor(ref),
        SwapApiVersionsInterceptor(ref),
        RemoveApiversionInterceptor(),
        NationalitiesReqInterceptor(),
        MoquemaInterceptor(ref),
      ]);
  },
);

extension DioErrorX on DioError {
  String get errorMsg {
    switch (type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return 'Timeout';

      case DioErrorType.response:
        switch (response?.statusCode) {
          case 401:
            return '[${response?.statusCode}] Unauthorized, please try to login';
          case 403:
            return '[${response?.statusCode}] Forbidden operation, please try to login';

          case 404:
            return '[${response?.statusCode}] Not found';

          case 500:
            return '[${response?.statusCode}] Internal server error';

          default:
            return '[${response?.statusCode}] Server Error ';
        }

      case DioErrorType.cancel:
        return 'Request has been cancelled';

      case DioErrorType.other:
        return 'An unknown error occured';
    }
  }
}

class SessionExpiredInterceptor implements Interceptor {
  final Ref ref;
  SessionExpiredInterceptor(this.ref);
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // ref.read(authControllerProvider.notifier).logout();
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('this please ${options.path + options.headers.toString()}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}

class SwapApiVersionsInterceptor implements Interceptor {
  final Ref ref;
  SwapApiVersionsInterceptor(this.ref);
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains('Auth/Register') ||
        options.path.contains('Auth/GetLoginOtp') ||
        options.path.contains('Booking/IsServedAddress') ||
        options.path.contains('Auth/Login') ||
        options.path.contains('Auth/SetFCMToken')) {
      options.path = options.baseUrl.replaceAll('v1', 'v2') + options.path;
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}

class RemoveApiversionInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains('Log/CreateAppLog')) {
      options.path = options.baseUrl.split('/mobile/v1').first + options.path;
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}

class NationalitiesReqInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains('CustomerProfile/GetNationalities')) {
      log('queryyy ${options.queryParameters}');
      if ((options.queryParameters['searchText'] as String).isEmpty) {
        options.queryParameters.remove('searchText');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}

class MoquemaInterceptor implements Interceptor {
  final Ref ref;
  const MoquemaInterceptor(this.ref);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) =>
      handler.next(err);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains('Moqueema')) {
      options.baseUrl = const String.fromEnvironment('MOQUEMA_API_URL');
    } else if (options.path.contains('CustomerAppIntegration')) {
      options.baseUrl = 'https://test.arco.sa:520/api';
    } else {
      options.baseUrl = ref.read(configProvider).apiURL;
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) =>
      handler.next(response);
}
