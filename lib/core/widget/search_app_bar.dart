import 'package:flutter/material.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/routes/app_routing.dart';

import '../routes/routes.dart';
import '../theme/colors_helper.dart';
import '../theme/text_theme.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key, this.onChanged, required this.enabled,required this.hintText, this.hintStyle, this.suffixIcon,
  });
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final bool enabled;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextFormField(
        // enabled: false,
        onTap: () {
          if(enabled) return;
          context.pushNamed(Routes.search);
        },
        onChanged: (value) {
          if(onChanged != null) onChanged!(value);
        },
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          hintStyle: hintStyle ??
              TextStyles.font14whiteRegular
                  .copyWith(color: ColorsManager.textSearch),
          filled: true,
          fillColor: ColorsManager.backgroundSearch,
          suffixIcon: suffixIcon ??
              const Icon(
                Icons.search,
                color: ColorsManager.textSearch,
              ),
        ),
      ),
    );
  }
}
