import 'package:flutter/material.dart';
import 'package:movies/core/helpers/extentions.dart';
import '../../../../core/routes/routes.dart';
import '../../data/model/move_model.dart';
import '../../data/network/api_constants.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({
    super.key, required this.movies,
  });

  final List<MoveModel> movies;

  @override

  Widget build(BuildContext context,) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3/2,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: ( context,  index){
          return GestureDetector(
            onTap: (){
              context.pushNamed(Routes.details);
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Image.network(
                '${ApiConst.urlImage}${movies[index].posterPath}',
                fit: BoxFit.cover,
              ),),
          );
        });
  }
}
