import 'package:flutter_peli_apps/domain/datasources/movies.datasources.dart';
import 'package:flutter_peli_apps/domain/entities/movie.entity.dart';
import 'package:flutter_peli_apps/domain/repositories/movies.repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;

  MoviesRepositoryImpl( this.datasource );
  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }

}