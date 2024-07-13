import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/theme/colors_helper.dart';
import 'package:movies/feature/home/logic/provider.dart';
import '../../core/routes/routes.dart';
import '../../core/theme/colors_helper.dart';
import '../../core/theme/text_theme.dart';
import '../../core/widget/loaging_widget.dart';
import '../../core/widget/search_app_bar.dart';
import 'data/model/move_model.dart';
import 'data/network/api_constants.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key,});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 10, left: 10),
        child: SafeArea(
          child: Consumer(
            builder: (context,ref ,widget) {
              final refMovePlaying =
              ref.watch(getMovieByTypeProvider(ApiConst.nowPlaying));
              return refMovePlaying.when(
                data: (move) {
                  return  ListSeeAll(movies: move);
                  // return MoviesListView(movies: move.take(10).toList());
                },
                error: (error, stackTrac) => ErrorWidget(error),
                loading: () => const LoadingWidget(),
              );

            }
          ),
        ),
      ),
    );
  }
}

class ListSeeAll extends StatelessWidget {
  const ListSeeAll({
    super.key,
    required this.movies,
  });

  final List<MoveModel> movies;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  context.pushNamed(Routes.details,arguments: movies[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 3/2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.network(
                              '${ApiConst.urlImage}${movies[index].posterPath}',
                              fit: BoxFit.cover,
        
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Text(movies[index].originalTitle, style: TextStyles.font14whiteMedium,),
                      const SizedBox(height: 4,),
                      Text(movies[index].releaseDate, style: TextStyles.font14whiteMedium.copyWith(color: ColorsManager.blue),),
                      Row(
                          mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Vote Count : ', style: TextStyles.font12BlueMedium,),
                          Text(movies[index].voteCount.toString(), style: TextStyles.font12BlueMedium,),
                        ],
                      ),
        
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
