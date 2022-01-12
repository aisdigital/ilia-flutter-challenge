import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_ilia/app/modules/home/external/datasource/home_datasource_impl.dart';
import 'package:teste_ilia/app/shared/util/dio_builder.dart';

void main() {
  final dio = Dio(DioBuilderFilmes());
  final dataSourceImpl = HomeDataSourceImpl(dio: dio);

  test('Testar retorno da api de filmes populares', () async {
    var result = await dataSourceImpl.getFilmesPopular();

    expect(result.isNotEmpty,true);
  });
  test('Testar retorno da api de filmes Rated', () async {
    var result = await dataSourceImpl.getFilmesRated();

    expect(result.isNotEmpty,true);
  });
  test('Testar retorno da api de pesquisa', () async {
    var result = await dataSourceImpl.seachFilmes('teste');

    expect(result.isEmpty,false);
  });
}