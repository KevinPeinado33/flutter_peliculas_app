import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_peli_apps/presentation/providers/providers.dart';
import 'package:flutter_peli_apps/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: _HomeView(), 
        bottomNavigationBar: CustomBottomNavigation()
    );
  }

}

class _HomeView extends ConsumerStatefulWidget {

  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();

}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {

    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();

  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);

    if ( initialLoading ) return const FullScreenLoader();

    final slideShowMovies  = ref.watch(moviesSlidesShowProvider);

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies    = ref.watch(popularMoviesProvider);
    final upcomingMovies   = ref.watch(upcomingMoviesProvider);
    final topRatedMovies   = ref.watch(topRatedMoviesProvider);

    return CustomScrollView( slivers: [

      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          background: CustomAppbar(),
        ),
      ),

      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              // const CustomAppbar(),

              MoviesSlideshow(movies: slideShowMovies),

              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subTitle: 'Lunes 20',
                loadNextPage: () {
                  // usar read cuando estemos en funciones o callbacks
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),

              MovieHorizontalListview(
                movies: popularMovies,
                title: 'Popular',
                loadNextPage: () {
                  // usar read cuando estemos en funciones o callbacks
                  ref.read(popularMoviesProvider.notifier).loadNextPage();
                },
              ),

              MovieHorizontalListview(
                movies: upcomingMovies,
                title: 'Próximo',
                subTitle: 'Agosto',
                loadNextPage: () {
                  // usar read cuando estemos en funciones o callbacks
                  ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                },
              ),

              MovieHorizontalListview(
                movies: topRatedMovies,
                title: 'Mejor valorados',
                loadNextPage: () {
                  // usar read cuando estemos en funciones o callbacks
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                },
              ),
              
              const SizedBox(height: 15),

            ],
          );
        }, childCount: 1),
      )
    ]);
  }
}
