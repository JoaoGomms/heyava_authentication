import 'package:dio/dio.dart';

Dio cepClient() => Dio(
      BaseOptions(
        baseUrl: 'https://viacep.com.br/ws',
      ),
    );
