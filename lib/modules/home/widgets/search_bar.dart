/*
  Copyright (c) 2023 Junaid Tariq

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  Visit: https://www.flutterninja.com
  Email: developer@flutterninja.com
*/

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:tentwenty_test/constants/app_colors.dart';
import 'package:tentwenty_test/constants/app_text_styles.dart';
import 'package:tentwenty_test/modules/watch/view_models/watch_view_model.dart';
import 'package:tentwenty_test/services/provider_service.dart';
import 'package:tentwenty_test/services/state_service.dart';
import 'package:tentwenty_test/widgets/buttons.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  const CustomSearchBar({super.key, required this.controller, required this.onSubmitted});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool expandSearch = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
      child: expandSearch
          ? MySearchBar(
        onSubmitted: widget.onSubmitted,
              controller: widget.controller,
              onLeadingTap: () {},
              onTrailingTap: () {
                setState(() {
                  changeSearchState();
                });
              },
              hintText: "TV shows, movies and more")
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Watch",
                  style: AppTextStyles.h6Text
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                Buttons.customIconButton(
                  iconData: CupertinoIcons.search,
                  onTap: () {
                    setState(() {
                      changeSearchState();
                    });
                  },
                ),
              ],
            ),
    );
  }

  void changeSearchState() {
    final state = StateService.context.read(ProviderService.watchProvider);
    expandSearch = !expandSearch;
    if(expandSearch){
      state.searchBarState = SearchBarState.active;
    }
    else{
      state.searchBarState = SearchBarState.inActive;
      state.searchController.clear();
    }
  }
}

class MySearchBar extends StatelessWidget {
  final IconData? leadingIconData;
  final IconData? trailingIconData;
  final TextEditingController controller;
  final Function() onLeadingTap;
  final Function() onTrailingTap;
  final Function(String) onSubmitted;
  final String hintText;
  const MySearchBar(
      {super.key,
      this.leadingIconData,
      this.trailingIconData,
      required this.controller,
      required this.onLeadingTap,
      required this.onTrailingTap,
      required this.hintText, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      leading: IconButton(
        icon: Icon(
          leadingIconData ?? CupertinoIcons.search,
          color: AppColors.darkGreySwatch,
        ),
        onPressed: onLeadingTap,
      ),
      onSubmitted: onSubmitted,
      trailing: [
        IconButton(
          icon: Icon(trailingIconData ?? Icons.close,
              color: AppColors.darkGreySwatch),
          onPressed: onTrailingTap,
        )
      ],
      backgroundColor: MaterialStateColor.resolveWith(
          (states) => AppColors.lightWhiteSwatch),
      shadowColor: MaterialStateColor.resolveWith(
          (states) => AppColors.lightWhiteSwatch),
      elevation: MaterialStateProperty.resolveWith<double>(
          (states) => states.contains(MaterialState.pressed) ? 1.0 : 0.0),
      hintText: hintText,
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (states) => AppTextStyles.bodyText,
      ),
      hintStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (states) => AppTextStyles.bodyText
            .copyWith(color: AppColors.fontSwatch.withOpacity(0.5)),
      ),
    );
  }
}
