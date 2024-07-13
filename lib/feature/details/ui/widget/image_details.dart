import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/core/theme/colors_helper.dart';
import 'package:movies/core/theme/colors_helper.dart';
import 'package:movies/core/theme/colors_helper.dart';
import 'package:movies/core/theme/colors_helper.dart';
import 'package:movies/core/theme/text_theme.dart';
import 'package:movies/feature/home/data/model/move_model.dart';

import '../../../home/data/network/api_constants.dart';
import '../../../home/logic/provider.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({super.key, required this.moveModel});

  final MoveModel moveModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 300, maxHeight: 420),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Image.network(
            '${ApiConst.urlImage}${moveModel.backdropPath}',
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
        ),
        Positioned(
          bottom: -50,
          left: 10,
          child: SizedBox(
            height: 150,
            width: 100,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Image.network(
                  '${ApiConst.urlImage}${moveModel.posterPath}',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          bottom: 42,
          right: 10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star,
                size: 20,
                color: Colors.yellow,
              ),
              Text(
                moveModel.voteCount.toString(),
                style: TextStyles.font14whiteMedium,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -20,
          left: 110,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              moveModel.originalTitle,
              style: TextStyles.font18whiteSemiBold,
            ),
          ),
        ),
      ],
    );
  }
}
