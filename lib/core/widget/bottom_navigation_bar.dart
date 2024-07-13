import 'package:flutter/material.dart';

import 'package:movies/core/theme/colors_helper.dart';
import 'package:movies/core/theme/text_theme.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    super.key,
  });

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int selectedIndex = 0;

  void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.playlist_add_sharp,
          ),
          label: 'List watch',
        ),
      ],
      currentIndex: selectedIndex,
      elevation: 0,
      selectedLabelStyle:
      TextStyles.font14whiteRegular.copyWith(color: ColorsManager.blue),
      showUnselectedLabels: true,
      unselectedFontSize: 14,
      unselectedItemColor: ColorsManager.gray,
      selectedItemColor: ColorsManager.blue,
      onTap: (index) => _onItemSelected(index),
      backgroundColor: ColorsManager.backgroundNavigationBar,
    );
  }
}
