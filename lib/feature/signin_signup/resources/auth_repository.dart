import 'package:roomy/common/constant/env.dart';
import 'package:roomy/common/http/api_provider.dart';
import 'package:roomy/common/http/response.dart';
import 'package:roomy/common/util/internet_check.dart';
import 'package:meta/meta.dart';

import 'auth_api_provider.dart';

class AuthRepository {
  AuthRepository(
      {@required this.env,
      @required this.apiProvider,
      @required this.internetCheck}) {
    authApiProvider =
        AuthApiProvider(baseUrl: env.baseUrl, apiProvider: apiProvider);
  }
  final ApiProvider apiProvider;
  AuthApiProvider authApiProvider;
  InternetCheck internetCheck;
  Env env;

  Future<DataResponse<String>> signIn(String email, String password) async {
    final response = await authApiProvider.signIn(email, password);
    if (response == null) {
      return DataResponse.connectivityError();
    }

    if (!response['error']) {
      final String token = response['token'];
      apiProvider.setToken(token);
      return DataResponse.success(token);
    } else {
      return DataResponse.error('Error');
    }
  }

  Future<Map<String, dynamic>> signUp(
      String email, String password, String name) {
    return authApiProvider.signUp(email, password, name);
  }
}
