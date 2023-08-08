import 'package:dio/dio.dart';

import 'package:flutter_peli_apps/config/constants/environment.dart';
import 'package:flutter_peli_apps/domain/datasources/movies.datasources.dart';
import 'package:flutter_peli_apps/domain/entities/movie.entity.dart';
import 'package:flutter_peli_apps/infrastructure/mappers/movie.mapper.dart';
import 'package:flutter_peli_apps/infrastructure/models/moviedb/movie_details.dart';
import 'package:flutter_peli_apps/infrastructure/models/moviedb/moviedb.reponse.dart';

class MoviedbDatasource extends MoviesDatasource {
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key' : Environment.theMovieDbKey,
      'language': 'es-Pe'
    }
  ));

  @override
  Future< List < Movie > > getNowPlaying({ int page = 1 }) async {

    final response = await dio.get('/movie/now_playing', queryParameters: { 'page': page });

    return _jsontoMovies( response.data );

  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {

    final response = await dio.get('/movie/popular', queryParameters: { 'page': page });

    return _jsontoMovies( response.data );

  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    
    final response = await dio.get('/movie/top_rated', queryParameters: { 'page': page });

    return _jsontoMovies( response.data );

  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {

    final response = await dio.get('/movie/upcoming', queryParameters: { 'page': page });

    return _jsontoMovies( response.data );
    
  }

  @override
  Future<Movie> getMovieById(String id) async {
    
    final response = await dio.get('/movie/$id');

    if ( response.statusCode != 200 ) throw Exception('Movie with id: $id not found.'); 

    final movieDetails = MovieDetails.fromJson( response.data );

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    

    return movie;

  }
  
  List< Movie> _jsontoMovies( Map< String, dynamic > json ) {

    final movieDBResponse = MovieDbResponse.fromJson( json ); 

    final List< Movie > movies = movieDBResponse
                                    .results
                                    .where(( moviedb ) => moviedb.posterPath != 'no-poster')
                                    .map(( moviedb ) => MovieMapper.movieDBToEntity( moviedb ))
                                    .toList();

    return movies;

  } 

}