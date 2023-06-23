import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final login = Provider<Login>((ref) => Login(ref));

class Login {
  static final bffUrl = dotenv.env['BFF_URL'];

  final Ref ref;
  Login(this.ref);

  Future login() async {
    final dio = Dio();
    final response = await dio.get('https://pub.dev');
    return response;
  }
}
