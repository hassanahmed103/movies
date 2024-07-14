import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/core/widget/loadging_widget.dart';
import 'package:movies/feature/home/data/network/api_constants.dart';

import '../../../../core/theme/text_theme.dart';
import '../../data/model/move_model.dart';
import '../../logic/provider.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key,required this.movies, required this.title, required this.apiProvider, });

  final List<MoveModel> movies;
  final String title;
  final String apiProvider;
  @override
  Widget build(BuildContext context) {
    // if(movies.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyles.font18whiteSemiBold,
              ),
              TextButton(
                onPressed: () {
                  context.pushNamed(
                    Routes.seeAll,
                    arguments:movies,
                  );
                },
                child: Text(
                  'See All',
                  style: TextStyles.font14whiteMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          MoviesListView(movies: const [],apiProvider: apiProvider,),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class MoviesListView extends StatelessWidget {
  const MoviesListView(
      {super.key, required this.movies, required this.apiProvider});
  final String apiProvider;
  final List<MoveModel> movies;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, index) {
        final refMovePlaying = ref.watch(getMovieByTypeProvider(apiProvider));
        return refMovePlaying.when(
          data: (movies) {
            return SizedBox(
              height: 230,
              child: ListView.builder(
                itemCount: movies.take(10).length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: GestureDetector(
                          onTap: () => context.pushNamed(
                            Routes.details,
                            arguments: movies[index],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              '${ApiConst.urlImagePoster}${movies[index].posterPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 75,
                          child: Text(
                            movies[index].title,
                            style: TextStyles.font14whiteMedium,
                          ),),
                    ],
                  );
                },
              ),
            );
            //
          },
          error: (error, stackTrac) => ErrorWidget(error),
          loading: () => const LoadingWidget(),
        );
      },
    );
  }
}