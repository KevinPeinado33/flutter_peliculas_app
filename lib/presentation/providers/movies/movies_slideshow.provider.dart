
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_peli_apps/domain/entities/movie.entity.dart';
import 'package:flutter_peli_apps/presentation/providers/movies/movies.provider.dart';

final moviesSlidesShowProvider = Provider< List< Movie > >(( ref ) {

  final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

  if ( nowPlayingMovies.isEmpty ) return [];

  return nowPlayingMovies.sublist(0, 6);

});