import 'package:flutter/material.dart';
import 'package:movies/core/theme/colors_helper.dart';
import 'package:movies/feature/home/data/network/api_constants.dart';
import 'package:movies/feature/home/ui/widget/movies_list_view.dart';
import '../../core/theme/text_theme.dart';
import '../../core/widget/bottom_navigation_bar.dart';
import '../../core/widget/search_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: ColorsManager.background,
                title: Text(
                  'What do you want to watch ?',
                  style: TextStyles.font18whiteSemiBold.copyWith(fontSize: 22),
                )),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: SearchAppBar(
                  hintText: 'search',
                  enabled: false,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionWidget(
                movies: [],
                title: 'Playing Now',
                apiProvider: ApiConst.nowPlaying,
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionWidget(
                movies: [],
                title: 'Popular',
                  apiProvider: ApiConst.popular
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionWidget(
                movies: [],
                title: 'Upcoming',
                  apiProvider: ApiConst.upcoming
              ),
            ),
            const SliverToBoxAdapter(
              child: SectionWidget(
                movies: [],
                title: 'Top Rated',
                  apiProvider: ApiConst.topRated
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
