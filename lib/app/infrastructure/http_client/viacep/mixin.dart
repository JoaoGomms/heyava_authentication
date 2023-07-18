import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

mixin CepClient {
  Dio get cepClient => GetIt.I.get<Dio>(instanceName: 'cepClient');
}
