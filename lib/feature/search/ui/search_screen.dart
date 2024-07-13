import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/theme/colors_helper.dart';
import 'package:movies/core/theme/text_theme.dart';
import 'package:movies/core/widget/search_app_bar.dart';
import 'package:movies/feature/home/data/network/api_constants.dart';
import 'package:movies/feature/search/logic/search_provider.dart';

import '../../../core/routes/routes.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults = ref.watch(searchControllerProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManager.background,
          actions: const [
            Icon(
              Icons.info,
              color: ColorsManager.white,
            )
          ],
          leading: const Icon(
            Icons.arrow_back,
            color: ColorsManager.white,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'search',
            style: TextStyles.font18whiteSemiBold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SafeArea(
            child: Column(
              children: [
                SearchAppBar(
                  enabled: true,
                  hintText: 'Search',
                  hintStyle: TextStyles.font14whiteRegular,
                  onChanged: (value) {
                    EasyDebounce.debounce(
                      'movie-search',
                      const Duration(milliseconds: 500),
                      () => ref
                          .read(searchControllerProvider.notifier)
                          .searchMovies(
                            query: value,
                          ),
                    );
                  },
                  suffixIcon: const Icon(
                    Icons.info_outline,
                    color: ColorsManager.white,
                  ),
                ),
                const SizedBox(height: 8),
                searchResults.when(
                  data: (movies) {
                    return Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: movies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.details,
                                  arguments: movies[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 10),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 3 / 2,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: Image.network(
                                          '${ApiConst.urlImage}${movies[index].posterPath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    movies[index].originalTitle,
                                    style: TextStyles.font14whiteMedium,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    movies[index].releaseDate,
                                    style: TextStyles.font14whiteMedium
                                        .copyWith(color: ColorsManager.blue),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Vote Count : ',
                                        style: TextStyles.font12BlueMedium,
                                      ),
                                      Text(
                                        movies[index].voteCount.toString(),
                                        style: TextStyles.font12BlueMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  error: (err, stack) => Placeholder(),
                  loading: () => CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ));
  }
}
