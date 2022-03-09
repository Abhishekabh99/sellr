import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../common/constants.dart';
import '../model/getshop_modal.dart';

class RepositoryProvider extends GetConnect with GetxServiceMixin {
  //End Points
  static const _register = "register";
  static const _login = "login";
  static const endpoint = "getShop";

  @override
  void onInit() {
    httpClient.baseUrl = 'https://obscure-ocean-76331.herokuapp.com/';
    // It's will attach 'apikey' property on header from all requests

    httpClient.addRequestModifier((Request request) {
      printLog("API URL (${request.method}): ${request.url}");
      printLog("API Request: ${request.toString()}");
      return request;
    });

    // Even if the server sends data from the country "Brazil",
    // it will never be displayed to users, because you remove
    // that data from the response, even before the response is delivered
    httpClient.addResponseModifier((request, response) {
      printLog("API Response: ${response.body}");
      return response;
    });
  }

  static const String _somethingWentWrongPleaseCheckYourInternet =
      "Something went wrong. Please check your internet connection or try again later.";

  static Map<String, dynamic> _errorResponse(String message) {
    return Map.of({"status": 400, "message": message});
  }

  Map<String, dynamic> _exceptionHandler(e) {
    if (e is SocketException) {
      return _errorResponse(_somethingWentWrongPleaseCheckYourInternet);
    } else if (e is TimeoutException) {
      return _errorResponse(_somethingWentWrongPleaseCheckYourInternet);
    } else {
      return _errorResponse(e.toString());
    }
  }

  //----------------------------------------------------------------------------
  // Future<LoginResponse> login(String email, String password) async {
  //   try {
  //     final response = await post(
  //         _login, {"email": email, "password": password}, decoder: (json) {
  //       return LoginResponse.fromJson(json);
  //     });

  //     return response.body!;
  //   } catch (e) {
  //     return LoginResponse.fromJson(_exceptionHandler(e));
  //   }
  // }

  Future<GetShopModal> getShop(String id) async {
    try {
      final response = await post(endpoint, {
        "id": id,
      }, decoder: (json) {
        return GetShopModal.fromJson(json);
      });

      return response.body!;
    } catch (e) {
      return GetShopModal.fromJson(_exceptionHandler(e));
    }
  }
}
