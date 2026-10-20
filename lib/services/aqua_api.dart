import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AquaApiException implements Exception {
  const AquaApiException(this.message);
  final String message;
  @override
  String toString() => message;
}

class AquaApi {
  AquaApi._();
  static final instance = AquaApi._();
  static const base = String.fromEnvironment('AQUASENSE_API_BASE_URL');
  static const _token = 'aquasense_access_token';
  static const _intro = 'aquasense_onboarding_complete';
  static const _storage = FlutterSecureStorage();
  final _http = HttpClient()..connectionTimeout = const Duration(seconds: 12);

  Uri _uri(String path) {
    if (base.isEmpty) throw const AquaApiException('Server is not configured for this build.');
    return Uri.parse(base).resolve(path);
  }

  Future<Map<String,dynamic>> _send(String path,{String method='GET',Map<String,String>? form,Map<String,dynamic>? json,bool auth=false}) async {
    try {
      final req = await _http.openUrl(method,_uri(path)).timeout(const Duration(seconds:15));
      req.headers.set(HttpHeaders.acceptHeader,'application/json');
      if (form != null) {
        req.headers.contentType = ContentType('application','x-www-form-urlencoded',charset:'utf-8');
        req.write(Uri(queryParameters:form).query);
      } else if (json != null) {
        req.headers.contentType = ContentType.json;
        req.write(jsonEncode(json));
      }
      if (auth) {
        final token=await _storage.read(key:_token);
        if (token==null || token.isEmpty) throw const AquaApiException('Please sign in again.');
        req.headers.set(HttpHeaders.authorizationHeader,'Bearer $token');
      }
      final res=await req.close().timeout(const Duration(seconds:15));
      final body=await utf8.decoder.bind(res).join();
      final decoded=body.isEmpty? <String,dynamic>{} : (jsonDecode(body) as Map<String,dynamic>);
      if (res.statusCode<200 || res.statusCode>=300) {
        final detail=decoded['detail'];
        throw AquaApiException(detail is String?detail:'Request failed. Please try again.');
      }
      return decoded;
    } on SocketException {
      throw const AquaApiException('Could not reach AquaSense. Check your connection and try again.');
    } on FormatException {
      throw const AquaApiException('AquaSense returned an unexpected response.');
    } on HttpException {
      throw const AquaApiException('AquaSense could not complete the request. Try again.');
    }
  }

  Future<Map<String,dynamic>> register(String name,String email,String password) =>
    _send('/auth/register',method:'POST',json:{'name':name,'email':email,'password':password});

  Future<Map<String,dynamic>> login(String email,String password) async {
    final result=await _send('/auth/login',method:'POST',form:{'username':email,'password':password});
    final token=result['access_token'];
    if (token is! String || token.isEmpty) throw const AquaApiException('Sign-in response did not include a session.');
    await _storage.write(key:_token,value:token);
    return result;
  }

  Future<Map<String,dynamic>> me()=>_send('/auth/me',auth:true);
  Future<void> deleteAccount(String password) async {
    await _send('/auth/me',method:'DELETE',json:{'password':password},auth:true);
    await _storage.delete(key:_token);
  }
  Future<void> signOut()=>_storage.delete(key:_token);
  Future<bool> onboardingComplete() async => await _storage.read(key:_intro)=='true';
  Future<void> markOnboardingComplete()=>_storage.write(key:_intro,value:'true');
}
