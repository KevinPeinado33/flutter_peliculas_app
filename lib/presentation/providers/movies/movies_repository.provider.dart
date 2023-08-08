import 'package:flutter_peli_apps/infrastructure/datasources/moviedb.datasource.dart';
import 'package:flutter_peli_apps/infrastructure/repositories/movies.repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  
  return MoviesRepositoryImpl( MoviedbDatasource() );

});
