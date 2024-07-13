import 'package:flutter/material.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/feature/home/data/model/move_model.dart';
import '../../../core/theme/colors_helper.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/widget/bottom_navigation_bar.dart';
import 'widget/image_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key,  required this.moveModel});

  final MoveModel moveModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsManager.background,
          elevation: 0,
          title: Padding(
            padding:
                const EdgeInsets.only(right: 40, bottom: 10, top: 10, left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Detail",
                  style: TextStyles.font18whiteSemiBold,
                ),
              ],
            ),
          ),
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 25, right: 20),
              child: Icon(
                Icons.verified_user_sharp,
                color: ColorsManager.white,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageDetails(
                moveModel:moveModel,
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('over View',style: TextStyles.font18whiteSemiBold,),
                  const SizedBox(height: 10,),
                  SizedBox(
                      height: 120,
                      child: Expanded(child: Text(moveModel.overview,style: TextStyles.font14whiteRegular,)))
                ],
              )


            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
